//
//  UIViewController+LHNavigationGesture.m
//  TestPopGestureSolution7
//
//  Created by liuhuan on 2017/8/29.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "UIViewController+LHNavigationGesture.h"
#import <objc/runtime.h>

@implementation UIViewController (LHNavigationGesture)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self swizzleBarHidden];
        [self swizzlePopGesture];
    });
}
#pragma mark - ******** 支持手势pop侧滑
+ (void)swizzlePopGesture
{
    Method viewDidLoad_originalMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method viewDidLoad_swizzledMethod = class_getInstanceMethod(self, @selector(lh_viewDidLoad));
    method_exchangeImplementations(viewDidLoad_originalMethod, viewDidLoad_swizzledMethod);
}
- (void)lh_viewDidLoad
{
    [self lh_viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}
#pragma mark - ******** 支持navigationBar的隐藏现实不突兀
+ (void)swizzleBarHidden
{
    Method viewWillAppear_originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method viewWillAppear_swizzledMethod = class_getInstanceMethod(self, @selector(lh_viewWillAppear:));
    method_exchangeImplementations(viewWillAppear_originalMethod, viewWillAppear_swizzledMethod);
}
- (void)lh_viewWillAppear:(BOOL)animated
{
    [self lh_viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.lh_hideNavBar animated:animated];
}

- (void)setLh_hideNavBar:(BOOL)lh_hideNavBar
{
    objc_setAssociatedObject(self, @selector(lh_hideNavBar), @(lh_hideNavBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)lh_hideNavBar
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
#pragma mark - ******** 支持UIScrollView侧滑滚动
- (void)lh_addPopGestureToView:(UIView *)view {
    if (!view) return;
    if (!self.navigationController) {
        // 在控制器转场的时候，self.navigationController可能是nil,这里用GCD和递归来处理这种情况
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self lh_addPopGestureToView:view];
        });
    } else {
        UIPanGestureRecognizer *pan = self.lh_popGestureRecognizer;
        if (![view.gestureRecognizers containsObject:pan]) {
            [view addGestureRecognizer:pan];
        }
    }
}

- (UIPanGestureRecognizer *)lh_popGestureRecognizer {
    UIPanGestureRecognizer *pan = objc_getAssociatedObject(self, _cmd);
    if (!pan) {
        
        NSArray *internalTargets = [self.navigationController.interactivePopGestureRecognizer valueForKey:@"targets"];
        id target = [internalTargets.firstObject valueForKey:@"target"];
        SEL action = NSSelectorFromString(@"handleNavigationTransition:");
        pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
        pan.maximumNumberOfTouches = 1;
        pan.delegate = self.navigationController;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        objc_setAssociatedObject(self, _cmd, pan, OBJC_ASSOCIATION_ASSIGN);
    }
    return pan;
}
@end

#pragma mark  ******** 支持UIScrollView类型侧滑滚动
@interface UINavigationController (LHPopGesturePrivate)
@end

@implementation UINavigationController (LHPopGesture)

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    if ([self.navigationController.transitionCoordinator isAnimated]) {
        return NO;
    }
    if (self.childViewControllers.count <= 1) {
        return NO;
    }
    
    // 侧滑手势触发位置
    CGPoint location = [gestureRecognizer locationInView:self.view];
    CGPoint offSet = [gestureRecognizer translationInView:gestureRecognizer.view];
    BOOL ret = (0 < offSet.x && location.x <= 40);
    return ret;
}

/// 只有当系统侧滑手势失败了，才去触发ScrollView的滑动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

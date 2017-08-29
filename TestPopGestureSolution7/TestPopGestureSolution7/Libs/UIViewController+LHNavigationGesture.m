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
        Method viewWillAppear_originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method viewWillAppear_swizzledMethod = class_getInstanceMethod(self, @selector(lh_viewWillAppear:));
        method_exchangeImplementations(viewWillAppear_originalMethod, viewWillAppear_swizzledMethod);
        
        Method viewDidLoad_originalMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method viewDidLoad_swizzledMethod = class_getInstanceMethod(self, @selector(lh_viewDidLoad));
        method_exchangeImplementations(viewDidLoad_originalMethod, viewDidLoad_swizzledMethod);
    });
}

- (void)lh_viewWillAppear:(BOOL)animated
{
    // Forward to primary implementation.
    [self lh_viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.lh_hideNavBar animated:animated];
}
- (void)lh_viewDidLoad
{
    [self lh_viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}
#pragma mark - ******** getter && setter
- (void)setLh_hideNavBar:(BOOL)lh_hideNavBar
{
    objc_setAssociatedObject(self, @selector(lh_hideNavBar), @(lh_hideNavBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)lh_hideNavBar
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
@end

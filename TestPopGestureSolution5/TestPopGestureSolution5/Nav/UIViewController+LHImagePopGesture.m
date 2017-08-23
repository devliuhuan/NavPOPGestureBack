//
//  UIViewController+LHImagePopGesture.m
//  TestPopGestureSolution5
//
//  Created by liuhuan on 2017/8/23.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "UIViewController+LHImagePopGesture.h"
#import <objc/runtime.h>

@implementation UIViewController (LHImagePopGesture)
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
        UINavigationController *nav = self.navigationController;
        pan = [[UIPanGestureRecognizer alloc] initWithTarget:nav action:@selector(panGestureRecognizerAction:)];
        pan.maximumNumberOfTouches = 1;
        pan.delegate = nav;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        objc_setAssociatedObject(self, _cmd, pan, OBJC_ASSOCIATION_ASSIGN);
    }
    return pan;
}

- (BOOL)lh_interactivePopDisabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setLh_interactivePopDisabled:(BOOL)disabled {
    objc_setAssociatedObject(self, @selector(lh_interactivePopDisabled), @(disabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

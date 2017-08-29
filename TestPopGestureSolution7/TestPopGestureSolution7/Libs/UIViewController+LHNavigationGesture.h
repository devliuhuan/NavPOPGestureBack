//
//  UIViewController+LHNavigationGesture.h
//  TestPopGestureSolution7
//
//  Created by liuhuan on 2017/8/29.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LHNavigationGesture) <UIGestureRecognizerDelegate>
/// 是否隐藏导航栏
@property (nonatomic,assign) BOOL lh_hideNavBar;
/// 给view添加侧滑返回效果
- (void)lh_addPopGestureToView:(UIView *)view;

@end

//
//  UIViewController+LHImagePopGesture.h
//  TestPopGestureSolution5
//
//  Created by liuhuan on 2017/8/23.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LHImagePopGesture)
/// 给view添加侧滑返回效果
- (void)lh_addPopGestureToView:(UIView *)view;

/// 禁止该页面的侧滑返回
@property (nonatomic, assign) BOOL lh_interactivePopDisabled;
@end

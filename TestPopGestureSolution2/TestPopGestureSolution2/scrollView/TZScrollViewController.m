//
//  TZScrollViewController.m
//  TZScrollViewPopGesture
//
//  Created by 谭真 on 2016/10/5.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import "TZScrollViewController.h"
//#import "UINavigationController+TZPopGesture.h"

@interface LHScrollView : UIScrollView
@end
@implementation LHScrollView
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}
@end
#pragma mark - ********
@interface TZScrollViewController ()
@end

@implementation TZScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
}

- (void)configScrollView {
    UIScrollView *scrollView = [[LHScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(1000, 0);
    scrollView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:scrollView];
    
    // scrollView需要支持侧滑返回
    //[self tz_addPopGestureToView:scrollView];
    
    // 禁止该页面侧滑返回
    // self.tz_interactivePopDisabled = YES;
}

@end

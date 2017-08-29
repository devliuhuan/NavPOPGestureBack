//
//  LHBaseViewController.m
//  TestPopGestureSolution1
//
//  Created by liuhuan on 2017/8/22.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "LHBaseViewController.h"

@interface LHBaseViewController ()

@end

@implementation LHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIBarButtonItem *fixedButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    fixedButton.width = -8;
//    self.navigationItem.leftBarButtonItems = @[fixedButton,[self backBarButtonItem:@selector(goBack) target:self]];
    [self addBackItemWithAction:@selector(goBack)];
}
- (void)addBackItemWithAction:(SEL)action {
    // 设置返回按钮的文本
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"返回"
                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    
    // 设置返回按钮的背景图片
    UIImage *img = [UIImage imageNamed:@"navi_back_red"];
    img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    // 设置文本与图片的偏移量
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(5, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    // 设置文本的属性
    NSDictionary *attributes = @{UITextAttributeFont:[UIFont systemFontOfSize:16],
                                 UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero],
                                 NSForegroundColorAttributeName:[UIColor redColor],
                                 NSBackgroundColorAttributeName:[UIColor redColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
}
- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(UIBarButtonItem *) backBarButtonItem:(SEL)selector target:(id)target{
    
    UIImage *icon = [UIImage imageNamed:@"navi_back_red"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 12, 24)];
    [backButton setBackgroundImage:icon forState:UIControlStateNormal];
    [backButton setContentMode:UIViewContentModeScaleToFill];
    UIBarButtonItem *barBackButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [backButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return barBackButtonItem;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:self.lh_hidNav animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

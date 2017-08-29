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
    [self addBackItemWithAction:@selector(goBack)];
}
- (void)addBackItemWithAction:(SEL)action {
    // 设置返回按钮的文本
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"返回"
                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backButton];
    
}
- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

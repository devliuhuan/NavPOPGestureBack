//
//  TZScrollViewController.m
//  TZScrollViewPopGesture
//
//  Created by 谭真 on 2016/10/5.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import "TZScrollViewController.h"

#pragma mark - ********
@interface TZScrollViewController ()
@end

@implementation TZScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
}

- (void)configScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.contentSize = CGSizeMake(1000, 0);
    scrollView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:scrollView];
    
}

@end

//
//  LHMainViewController.m
//  TestPopGestureSolution1
//
//  Created by liuhuan on 2017/8/22.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "LHMainViewController.h"
#import "LHNavigationController.h"
#import "LHHomeViewController.h"
#import "LHFriendsViewController.h"
#import "LHClassifyViewController.h"
#import "LHMineViewController.h"

@interface LHMainViewController ()

@end

@implementation LHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupCustomTabBar];
}
-(void) setupCustomTabBar
{

    LHHomeViewController *homeVC = [LHHomeViewController new];
    homeVC.title = @"首页";
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
    [self addChildViewController:[[LHNavigationController alloc] initWithRootViewController:homeVC]];
    
    LHFriendsViewController *friendVC = [LHFriendsViewController new];
    friendVC.title = @"朋友";
    friendVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
    [self addChildViewController:[[LHNavigationController alloc] initWithRootViewController:friendVC]];
    
    LHClassifyViewController *classifyVC = [LHClassifyViewController new];
    classifyVC.title = @"分类";
    classifyVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2];
   [self addChildViewController:[[LHNavigationController alloc] initWithRootViewController:classifyVC]];
    
    LHMineViewController *mineVC = [LHMineViewController new];
    mineVC.title = @"我的";
    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:3];
    [self addChildViewController:[[LHNavigationController alloc] initWithRootViewController:mineVC]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

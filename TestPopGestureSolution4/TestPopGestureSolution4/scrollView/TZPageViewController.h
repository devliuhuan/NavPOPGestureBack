//
//  PageViewController.h
//  TZScrollViewPopGesture
//
//  Created by liuyuantao on 16/10/9.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHBaseViewController.h"

@interface TZPageViewController : LHBaseViewController

@end


@interface TZSubScrollViewController : UIViewController
@property (nonatomic, strong) UIScrollView *scrollView;
@end

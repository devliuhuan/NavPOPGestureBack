//
//  TZCollectionViewController.m
//  TZScrollViewPopGesture
//
//  Created by 谭真 on 2016/10/5.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import "TZCollectionViewController.h"
//#import "UINavigationController+TZPopGesture.h"
@interface LHCollectionView : UICollectionView
@end
@implementation LHCollectionView
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
@interface TZCollectionViewController ()
@end

@implementation TZCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configCollectionView];
}

- (void)configCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[LHCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    collectionView.contentSize = CGSizeMake(1000, 0);
    collectionView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:collectionView];
    
    // collectionView需要支持侧滑返回
    //[self tz_addPopGestureToView:collectionView];
}

@end

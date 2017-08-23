//
//  TZMapViewController.m
//  TZScrollViewPopGesture
//
//  Created by 谭真 on 2016/10/5.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import "TZMapViewController.h"
//#import "UINavigationController+TZPopGesture.h"
#import <MapKit/MapKit.h>

@interface LHMKMapView : MKMapView
@end
@implementation LHMKMapView
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    if (self.contentOffset.x <= 0) {
//        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
//            return YES;
//        }
//    }
//    return NO;
//}
@end
#pragma mark - ********
@interface TZMapViewController ()
@end

@implementation TZMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configMapView];
}

- (void)configMapView {
    MKMapView *mapView = [[LHMKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mapView];
    
    // mapView需要支持侧滑返回
    //[self tz_addPopGestureToView:mapView];
}

@end

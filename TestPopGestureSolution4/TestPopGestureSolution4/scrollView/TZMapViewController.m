//
//  TZMapViewController.m
//  TZScrollViewPopGesture
//
//  Created by 谭真 on 2016/10/5.
//  Copyright © 2016年 谭真. All rights reserved.
//

#import "TZMapViewController.h"
#import <MapKit/MapKit.h>

#pragma mark - ********
@interface TZMapViewController ()
@end

@implementation TZMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configMapView];
}

- (void)configMapView {
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mapView];
    
}

@end

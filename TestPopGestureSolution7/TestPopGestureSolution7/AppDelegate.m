//
//  AppDelegate.m
//  TestPopGestureSolution6
//
//  Created by liuhuan on 2017/8/23.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "AppDelegate.h"
#import "LHMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    LHMainViewController *mianVC = [[LHMainViewController alloc] init];
    self.window.rootViewController = mianVC;
    [self.window makeKeyAndVisible];
    [self setupUIStyle];
    return YES;

}
- (void)setupUIStyle
{
    // 设置返回按钮的背景图片
    UIImage *img = [UIImage imageNamed:@"navi_back_white"];
    //img = [img resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:img
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    // 设置文本与图片的偏移量
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, 0)
                                                         forBarMetrics:UIBarMetricsDefault];
    // 设置文本的属性
    NSDictionary *attributes = @{UITextAttributeFont:[UIFont systemFontOfSize:16],
                                 UITextAttributeTextShadowOffset:[NSValue valueWithUIOffset:UIOffsetZero],
                                 NSForegroundColorAttributeName:[UIColor redColor],
                                 NSBackgroundColorAttributeName:[UIColor redColor]};
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
//    CGRect frame = [[UIScreen mainScreen] bounds];
//    
//    UIGraphicsBeginImageContext(frame.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGFloat locations[] = { 0.0, 1.0 };
//    NSArray *colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor redColor].CGColor];
//    
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
//    
//    CGPoint startPoint = CGPointMake(0, 0);
//    CGPoint endPoint = CGPointMake(CGRectGetWidth(frame), 0);
//    
//    CGContextSaveGState(context);
//    CGContextClip(context);
//    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
//    CGContextRestoreGState(context);
//    
//    CGGradientRelease(gradient);
//    CGColorSpaceRelease(colorSpace);
//    
//    UIImage *backgroundImg = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    [[UINavigationBar appearance] setBackgroundImage:backgroundImg forBarMetrics:UIBarMetricsDefault];
//    
//    if ( [UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)] ) {
//        CGRect rect = CGRectMake( 0, 0, [UIScreen mainScreen].bounds.size.width, 1.0f );
//        UIGraphicsBeginImageContext(rect.size);
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextSetFillColorWithColor( context, [[UIColor clearColor] CGColor] );
//        CGContextFillRect( context, rect );
//        UIImage * shadowImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        [[UINavigationBar appearance] setShadowImage:shadowImage];
//    }
//    
//    /**
//     * 导航标题大小和颜色修改
//     */
//    
//    NSShadow *shadow = [[NSShadow alloc] init];
//    shadow.shadowColor = [UIColor clearColor];
//    shadow.shadowOffset = CGSizeMake(0, 0);
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
//                                                           shadow, NSShadowAttributeName,
//                                                           [UIFont systemFontOfSize:18], NSFontAttributeName,
//                                                           nil]];
//    
//    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

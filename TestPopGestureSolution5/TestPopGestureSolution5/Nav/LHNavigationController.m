//
//  LHNavigationController.m
//  TestPopGestureSolution1
//
//  Created by liuhuan on 2017/8/22.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "LHNavigationController.h"


@interface LHNavigationController ()
@property (strong, nonatomic)UIPanGestureRecognizer *panGestureRecognizer;
@property (strong, nonatomic)UIImageView *backView;
@property (nonatomic,strong) UIView * coverView;

@property (strong, nonatomic)NSMutableArray *backImgs;
@property (assign) CGPoint panBeginPoint;
@property (assign) CGPoint panEndPoint;
@end

@implementation LHNavigationController

- (void)loadView{
    [super loadView];
    
    [self initilization];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBaseUI];
}

- (void)initilization{
    self.backImgs = [[NSMutableArray alloc] init];
}

- (void)loadBaseUI{
    //原生方法无效
    self.interactivePopGestureRecognizer.enabled = NO;
    
    //设置手势
    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    [self.view addGestureRecognizer:self.panGestureRecognizer];
}

#pragma mark- public method
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //截图
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, 1.0);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.backImgs addObject:img];
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    [_backImgs removeLastObject];
    
    return [super popViewControllerAnimated:animated];
}
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger vcIndex = [self.childViewControllers indexOfObject:viewController];
    if (vcIndex >=0 && vcIndex < self.childViewControllers.count) {
        for (NSInteger i=(self.backImgs.count-1); i>=0; i--) {
            if (i>vcIndex) {
                [self.backImgs removeObjectAtIndex:i];
            }
        }
    }
    return [super popToViewController:viewController animated:animated];
}
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.backImgs removeAllObjects];
    return [super popToRootViewControllerAnimated:animated];
}
#pragma mark- private method
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    if ([self.navigationController.transitionCoordinator isAnimated]) {
        return NO;
    }
    if (self.childViewControllers.count <= 1) {
        return NO;
    }
    //UIViewController *vc = self.topViewController;
    // 侧滑手势触发位置
    CGPoint location = [gestureRecognizer locationInView:self.view];
    CGPoint offSet = [gestureRecognizer translationInView:gestureRecognizer.view];
    BOOL ret = (0 < offSet.x && location.x <= 40);
    // NSLog(@"%@ %@",NSStringFromCGPoint(location),NSStringFromCGPoint(offSet));
    return ret;
}
- (void)panGestureRecognizerAction:(UIPanGestureRecognizer*)panGestureRecognizer{
    if ([self.viewControllers count] == 1) {
        return ;
    }
    
    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"滑动开始");
        //存放滑动开始的位置
        self.panBeginPoint = [panGestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow];
        //插入图片
        [self insertLastViewFromSuperView:self.view.superview];
        
    }else if(panGestureRecognizer.state == UIGestureRecognizerStateEnded){
        NSLog(@"滑动结束");
        //存放数据
        self.panEndPoint = [panGestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow];
        
        if ((_panEndPoint.x - _panBeginPoint.x) > 50) {
            [UIView animateWithDuration:0.3 animations:^{
                [self moveNavigationViewWithLenght:[UIScreen mainScreen].bounds.size.width];
            } completion:^(BOOL finished) {
                [self removeLastViewFromSuperView];
                [self moveNavigationViewWithLenght:0];
                [self popViewControllerAnimated:NO];
            }];
            
            
        }else{
            [UIView animateWithDuration:0.3 animations:^{
                [self moveNavigationViewWithLenght:0];
            }];
        }
    }else{
        //添加移动效果
        CGFloat panLength = ([panGestureRecognizer locationInView:[UIApplication sharedApplication].keyWindow].x - _panBeginPoint.x);
        if (panLength > 0) {
            [self moveNavigationViewWithLenght:panLength];
        }
    }
    
}

/**
 *  移动视图界面
 *
 *  @param lenght 移动的长度
 */
- (void)moveNavigationViewWithLenght:(CGFloat)lenght{
    
    //图片位置设置
    self.view.frame = CGRectMake(lenght, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //图片动态阴影
    _backView.alpha = (lenght/[UIScreen mainScreen].bounds.size.width)*2/3 + 0.33;
    //_coverView.alpha = 1 - _backView.alpha+0.1;
    NSLog(@"### %.2f",_backView.alpha);
}

/**
 *  插图上一级图片
 *
 *  @param superView 图片的superView
 */
- (void)insertLastViewFromSuperView:(UIView *)superView{
    //插入上一级视图背景
    if (_backView == nil) {
        _backView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backView.image = [_backImgs lastObject];;
        _coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //_coverView.backgroundColor = [UIColor blackColor];
        [_backView addSubview:_coverView];
    }
    [self.view.superview insertSubview:_backView belowSubview:self.view];
}

/**
 *  移除上一级图片
 */
- (void)removeLastViewFromSuperView{
    [_backView removeFromSuperview];
    _backView = nil;
}




@end

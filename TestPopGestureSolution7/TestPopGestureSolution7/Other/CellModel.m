//
//  CellModel.m
//  TestPopGestureSolution1
//
//  Created by liuhuan on 2017/8/23.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel
+ (instancetype)title:(NSString *)title class:(NSString *)className
{
    CellModel *model = [CellModel new];
    model.title = title;
    model.className = className;
    return model;
}
- (Class)controllerClass
{
    return NSClassFromString(self.className);
}
@end

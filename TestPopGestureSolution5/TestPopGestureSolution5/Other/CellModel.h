//
//  CellModel.h
//  TestPopGestureSolution1
//
//  Created by liuhuan on 2017/8/23.
//  Copyright © 2017年 zqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *className;
@property (nonatomic,readonly) Class controllerClass;
+ (instancetype)title:(NSString *)title class:(NSString *)className;
@end

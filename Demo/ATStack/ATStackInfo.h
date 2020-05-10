//
//  ATStackInfo.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ATStack.h"
NS_ASSUME_NONNULL_BEGIN

@interface ATStackInfo : NSObject

@property(nonatomic, assign) CGFloat width;

@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) BOOL isFill;

@property(nonatomic, assign) CGFloat space;

@property(nonatomic, assign) CGFloat flex;

@property(nonatomic, assign) ATStackAlignment alignment;

//隐藏元素，同时改变其他元素的位置
@property(nonatomic, assign) BOOL hidden;


@property(nonatomic, strong) UIView *separateLine;


@end

NS_ASSUME_NONNULL_END

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

@class ATStackInfo;
@protocol ATStackInfoDelegate <NSObject>

- (void)stackInfoValueDidChange:(ATStackInfo*)info;

@end

@interface ATStackInfo : NSObject

@property(nonatomic, assign) CGFloat width;

@property(nonatomic, assign) CGFloat height;

//相对于父视图的大小，取值0-1之间
@property(nonatomic, assign) CGFloat multipliedBy;

@property(nonatomic, assign) CGFloat space;

@property(nonatomic, assign) CGFloat flex;

@property(nonatomic, assign) ATStackAlignment alignment;

//隐藏元素，同时改变其他元素的位置
@property(nonatomic, assign) BOOL hidden;

@property(nonatomic, strong) UIView *separateLine;

@property(nonatomic, assign) CGFloat separateLineLeftPadding;

@property(nonatomic, assign) CGFloat separateLineRightPadding;

@property(nonatomic, weak) id<ATStackInfoDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

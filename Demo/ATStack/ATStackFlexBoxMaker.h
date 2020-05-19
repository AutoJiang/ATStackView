//
//  ATStackFlexBoxMaker.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "UIView+ATStack.h"
NS_ASSUME_NONNULL_BEGIN

@interface ATStackFlexBoxMaker : NSObject

-(instancetype)initWithView:(UIView *)view;

-(ATStackFlexBoxMaker *(^)(CGFloat))flex;

-(ATStackFlexBoxMaker *(^)(CGFloat))width;

-(ATStackFlexBoxMaker *(^)(CGFloat))height;

-(ATStackFlexBoxMaker *(^)(CGFloat))space;

-(ATStackFlexBoxMaker *(^)(CGFloat))multipliedBy;

-(ATStackFlexBoxMaker *(^)(ATStackAlignment))alignment;
@end

NS_ASSUME_NONNULL_END

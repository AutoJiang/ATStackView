//
//  UIView+ATStack.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATStack.h"
#import "ATHorStack.h"
#import "ATVerStack.h"
#import "ATStackInfo.h"
#import "ATStackFlexBoxMaker.h"
NS_ASSUME_NONNULL_BEGIN
@class ATStackFlexBoxMaker;

@interface UIView(ATStack)

@property (nonatomic, strong) ATStack *stack;

@property (nonatomic, readonly, strong) ATStackInfo *info;

@property (nonatomic, readonly, weak) ATStack *superStack;

/**快速创建一个垂直方向、子控件从上到下布局的栈*/
-(ATVerStack *)getStackVer;

/**快速创建一个水平方向、子控件从左到右布局的栈*/
-(ATHorStack *)getStackHor;

//inset代表内间距
-(ATVerStack *)getStackVerWithInset:(UIEdgeInsets)inset;

-(ATHorStack *)getStackHorWithInset:(UIEdgeInsets)inset;

//添加分割线
-(UIView *)addLineSeparate;
//返回的分割线可自定义颜色和高度
-(UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding rightPadding: (CGFloat)rightPadding;

-(UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding;

-(UIView *)addLineSeparateWithRightPadding:(CGFloat)rightPadding;

-(UIView*)at_makeFlexBox:(void(^)(ATStackFlexBoxMaker *make))block;

-(UIView *)setAt_hidden:(BOOL)hidden;

-(BOOL)at_hidden;

-(UIView*)setAt_width:(CGFloat)width;

-(CGFloat)at_width;

-(UIView*)setAt_height:(CGFloat)height;

-(CGFloat)at_height;

-(UIView*)setAt_flex:(CGFloat)flex;

-(CGFloat)at_flex;

-(UIView*)setAt_space:(CGFloat)space;

-(CGFloat)at_space;

-(UIView*)setAt_multipliedBy:(CGFloat)multipliedBy;

-(CGFloat)at_multipliedBy;

-(UIView*)setAt_alignment:(ATStackAlignment)alignment;

-(ATStackAlignment)at_alignment;

-(UIView*)setStackNeedLayout;

@end

NS_ASSUME_NONNULL_END

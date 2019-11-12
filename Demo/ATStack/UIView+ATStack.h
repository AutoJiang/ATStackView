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
NS_ASSUME_NONNULL_BEGIN

@interface UIView(ATStack)


//快速为view添加一个Stack，返回ATVerStack

/**快速创建一个垂直方向、子控件从上到下布局的栈*/
-(ATVerStack *)getStackVer;

/**快速创建一个水平方向、子控件从左到右布局的栈*/
-(ATHorStack *)getStackHor;

/**快速创建一个水平方向、子控件均分的栈*/
-(ATHorStack *)getStackHorEqual;

/**快速创建一个垂直方向、子控件均分的栈*/
-(ATVerStack *)getStackVerEqual;

//inset代表内间距
-(ATVerStack *)getStackVerWithInset:(UIEdgeInsets)inset;

-(ATHorStack *)getStackHorWithInset:(UIEdgeInsets)inset;

-(ATHorStack *)getStackHorEqualWithInset:(UIEdgeInsets)inset;

-(ATVerStack *)getStackVerEqualWithInset:(UIEdgeInsets)inset;

//添加分割线
-(UIView *)addLineSeparate;
//返回的分割线可自定义颜色和高度
-(UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding;

//隐藏元素，同时改变其他元素的位置
-(void)setAt_hidden:(BOOL)hidden;

-(BOOL)at_hidden;

-(void)setAt_width:(CGFloat)width;

-(CGFloat)at_width;

-(void)setAt_height:(CGFloat)height;

-(CGFloat)at_height;

@property (nonatomic, strong) ATStack *stack;

@property (nonatomic, readonly, strong) ATStackInfo *info;

@end

NS_ASSUME_NONNULL_END

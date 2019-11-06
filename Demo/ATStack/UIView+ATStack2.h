//
//  UIView+ATStack2.h
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

@interface UIView(ATStack2)


//快速为view添加一个Stack，返回ATVerStack

/**快速创建一个垂直方向、子控件从上到下布局的栈*/
-(ATVerStack *)addStackVer;

/**快速创建一个水平方向、子控件从左到右布局的栈*/
-(ATHorStack *)addStackHor;

/**快速创建一个水平方向、子控件居中布局的栈*/
-(ATHorStack *)addStackHorCenter;

/**快速创建一个垂直方向、子控件居中布局的栈*/
-(ATVerStack *)addStackVerCenter;

/**快速创建一个水平方向、子控件均分的栈*/
-(ATHorStack *)addStackHorEqual;

/**快速创建一个垂直方向、子控件均分的栈*/
-(ATVerStack *)addStackVerEqual;

//inset代表内间距
-(ATVerStack *)addStackVerWithInset:(UIEdgeInsets)inset;

-(ATHorStack *)addStackHorWithInset:(UIEdgeInsets)inset;

-(ATHorStack *)addStackHorCenterWithInset:(UIEdgeInsets)inset;

-(ATVerStack *)addStackVerCenterWithInset:(UIEdgeInsets)inset;

-(ATHorStack *)addStackHorEqualWithInset:(UIEdgeInsets)inset;

-(ATVerStack *)addStackVerEqualWithInset:(UIEdgeInsets)inset;

//添加分割线
-(UIView *)addLineSeparate;

-(UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding;

//隐藏元素，但是不改变其他元素的位置
-(void)setAt_hidden:(BOOL)hidden;

-(BOOL)at_hidden;

-(void)setAt_width:(CGFloat)witdh;

-(CGFloat)at_width;

-(void)setAt_height:(CGFloat)height;

-(CGFloat)at_height;

@property (nonatomic, readonly, strong) ATStack *stack;

@property (nonatomic, readonly, strong) ATStackInfo *info;

@end

NS_ASSUME_NONNULL_END

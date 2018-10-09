//
//  UIView+ATStack.h
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/9.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATHorStackView.h"
#import "ATVerStackView.h"

@interface UIView(Stack)

//快速为view添加一个StackView，返回ATVerStackView

/**快速创建一个垂直方向、子控件从上到下布局的栈*/
-(ATVerStackView *)addStackVer;

/**快速创建一个水平方向、子控件从左到右布局的栈*/
-(ATHorStackView *)addStackHor;

/**快速创建一个水平方向、子控件居中布局的栈*/
-(ATHorStackView *)addStackHorCenter;

/**快速创建一个垂直方向、子控件居中布局的栈*/
-(ATVerStackView *)addStackVerCenter;

/**快速创建一个水平方向、子控件均分的栈*/
-(ATHorStackView *)addStackHorEqual;

/**快速创建一个垂直方向、子控件均分的栈*/
-(ATVerStackView *)addStackVerEqual;

//inset代表内间距
-(ATVerStackView *)addStackVerWithInset:(UIEdgeInsets)inset;

-(ATHorStackView *)addStackHorWithInset:(UIEdgeInsets)inset;

-(ATHorStackView *)addStackHorCenterWithInset:(UIEdgeInsets)inset;

-(ATVerStackView *)addStackVerCenterWithInset:(UIEdgeInsets)inset;

-(ATHorStackView *)addStackHorEqualWithInset:(UIEdgeInsets)inset;

-(ATVerStackView *)addStackVerEqualWithInset:(UIEdgeInsets)inset;

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
@end

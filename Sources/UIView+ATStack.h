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

//快速添加一个StackView
-(ATVerStackView *)addStackVer;

-(ATHorStackView *)addStackHor;

-(ATHorStackView *)addStackHorCenter;

-(ATVerStackView *)addStackVerCenter;

-(ATHorStackView *)addStackHorEqual;

-(ATVerStackView *)addStackVerEqual;

//inset代表内间距
-(ATVerStackView *)addStackVerWithInset:(UIEdgeInsets)inset;

-(ATHorStackView *)addStackHorWithInset:(UIEdgeInsets)inset;

-(ATHorStackView *)addStackHorCenterWithInset:(UIEdgeInsets)inset;

-(ATVerStackView *)addStackVerCenterWithInset:(UIEdgeInsets)inset;

-(ATHorStackView *)addStackHorEqualWithInset:(UIEdgeInsets)inset;

-(ATVerStackView *)addStackVerEqualWithInset:(UIEdgeInsets)inset;

@end

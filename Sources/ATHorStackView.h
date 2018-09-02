//
//  ATHorStackView.h
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/10.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATStackView.h"

@interface ATHorStackView : ATStackView

/**创建一个水平方向、子控件从上自下布局的栈*/
+(ATHorStackView *)getStackHor;

/**创建一个水平方向、子控件居中布局的栈*/
+(ATHorStackView *)getStackHorCenter;

/**创建一个水平方向、子控件均分的栈*/
+(ATHorStackView *)getStackHorEqueal;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(Boolean)isFill;

-(void)addArrangedSubview:(UIView*)view isFill:(Boolean)isFill;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill position:(ATStackViewPosition)position;

-(void)addSpacing:(CGFloat)spacing;

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion;
@end

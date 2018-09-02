//
//  ATVerStackView.h
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/10.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATStackView.h"
@interface ATVerStackView : ATStackView

/**创建一个垂直方向、子控件从上自下布局的栈*/
+(ATVerStackView *)getStackVer;

/**创建一个垂直方向、子控件居中布局的栈*/
+(ATVerStackView *)getStackVerCenter;

/**创建一个垂直方向、子控件均分的栈*/
+(ATVerStackView *)getStackVerEqueal;


-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height;

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height isFill:(Boolean)isFill;

-(void)addArrangedSubview: (UIView*)view isFill:(Boolean)isFill;

-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position;

-(void)addSpacing:(CGFloat)spacing;

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion;

@end

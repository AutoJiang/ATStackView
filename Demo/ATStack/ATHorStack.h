//
//  ATHorStack.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/5.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATStack.h"
NS_ASSUME_NONNULL_BEGIN

@interface ATHorStack : ATStack

/**创建一个水平方向、子控件从左到右布局的栈*/
+(ATHorStack *)getStackHor;

/**创建一个水平方向、子控件居中布局的栈*/
+(ATHorStack *)getStackHorCenter;

/**创建一个水平方向、子控件均分的栈*/
+(ATHorStack *)getStackHorEqueal;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill;

-(void)addArrangedSubview:(UIView*)view isFill:(BOOL)isFill;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill position:(ATStackViewPosition)position;

@end

NS_ASSUME_NONNULL_END

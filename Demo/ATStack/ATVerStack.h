//
//  ATVerStack.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATStack.h"
NS_ASSUME_NONNULL_BEGIN

@interface ATVerStack : ATStack

/**创建一个垂直方向、子控件从上到下布局的栈*/
+(ATVerStack *)getStackVer;

/**创建一个垂直方向、子控件居中布局的栈*/
+(ATVerStack *)getStackVerCenter;

/**创建一个垂直方向、子控件均分的栈*/
+(ATVerStack *)getStackVerEqueal;

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height;

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height isFill:(BOOL)isFill;

-(void)addArrangedSubview: (UIView*)view isFill:(Boolean)isFill;

-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position;

@end

NS_ASSUME_NONNULL_END

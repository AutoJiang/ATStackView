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

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height;

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height isFill:(BOOL)isFill;

-(void)addArrangedSubview: (UIView*)view isFill:(Boolean)isFill;

-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position;

@end

NS_ASSUME_NONNULL_END

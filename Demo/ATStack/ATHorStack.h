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

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill;

-(void)addArrangedSubview:(UIView*)view isFill:(BOOL)isFill;

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill position:(ATStackViewPosition)position;

@end

NS_ASSUME_NONNULL_END

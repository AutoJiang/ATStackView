//
//  ATStack+Private.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/10.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATStack.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATStack()

- (instancetype)initWithView:(UIView*)view;

-(void)layoutHeadFrames;

-(void)layoutCenterFrames;

-(void)layoutTailFrames;

-(void)layoutEqualFrame;

@end

NS_ASSUME_NONNULL_END

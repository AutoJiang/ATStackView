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

@property(nonatomic, assign) BOOL isNeedLayout;

- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)inset;

- (void)layoutHeadFrames;

- (void)layoutCenterFrames;

- (void)layoutTailFrames;


@end

NS_ASSUME_NONNULL_END

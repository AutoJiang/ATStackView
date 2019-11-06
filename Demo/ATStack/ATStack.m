//
//  ATStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATStack.h"

@interface ATStack()

@end

@implementation ATStack

- (instancetype)initWithView:(UIView*)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.arrangedSubviews = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position{
    [self.arrangedSubviews addObject:view];
}

-(void)addArrangedSubview:(UIView*)view{
    [self.arrangedSubviews addObject:view];
}



@end

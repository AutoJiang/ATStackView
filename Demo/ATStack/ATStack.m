//
//  ATStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATStack.h"
#import "UIView+ATStack2.h"

@interface ATStack()

@end

@implementation ATStack

- (instancetype)initWithView:(UIView*)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.arrangedSubviews = [[NSMutableArray alloc] init];
        view.stack = self;
    }
    return self;
}

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position{
    [self.arrangedSubviews addObject:view];
}

-(void)addArrangedSubview:(UIView*)view{
    [self.arrangedSubviews addObject:view];
}

-(void)addSpacing:(CGFloat)spacing{
    [self addSpacing:spacing postion:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion{
    if(postion == ATStackViewPositionHead){
        UIView *v = [self.arrangedSubviews lastObject];
        if(v){
            v.info.space = spacing;
        }
    }
    
}

-(void)layoutFrame{
    
}

@end

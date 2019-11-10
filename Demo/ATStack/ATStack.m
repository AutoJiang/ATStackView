//
//  ATStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "UIView+ATStack2.h"
#import "ATStack+Private.h"

@interface ATStack()

@end

@implementation ATStack

- (instancetype)initWithView:(UIView*)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.arrangedSubviewsHead = [[NSMutableArray alloc] init];
        self.arrangedSubviewsCenter = [[NSMutableArray alloc] init];
        self.arrangedSubviewsTail = [[NSMutableArray alloc] init];
        view.stack = self;
    }
    return self;
}

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position{
    switch (position) {
        case ATStackViewPositionHead:
            [self.arrangedSubviewsHead addObject:view];
            break;
        case ATStackViewPositionCenter:
            [self.arrangedSubviewsCenter addObject:view];
            break;
        case ATStackViewPositionTail:
            [self.arrangedSubviewsTail addObject:view];
            break;
        default:
            break;
    };
}

-(void)addArrangedSubview:(UIView*)view{
    [self addArrangedSubview:view position:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing{
    [self addSpacing:spacing postion:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion{
    UIView *v;
    if(postion == ATStackViewPositionHead){
        v = [self.arrangedSubviewsHead lastObject];
    }else if(postion == ATStackViewPositionCenter){
        v = [self.arrangedSubviewsCenter lastObject];
    }else if(postion == ATStackViewPositionTail){
        v = [self.arrangedSubviewsTail lastObject];
    }
    if(v){
        v.info.space = spacing;
    }
}

-(void)setAlignment:(ATStackAlignment)alignment{
    if(_alignment != alignment){
        _alignment = alignment;
        [self layoutFrame];
    }
}

-(void)layoutFrame{
    if(self.arrangedSubviewsHead.count <= 0 && self.arrangedSubviewsCenter.count <= 0 && self.arrangedSubviewsTail.count <= 0){
        return;
    }
    if (self.distribution == ATStackDistributionFill) {
        if(self.arrangedSubviewsHead.count > 0){
            [self layoutHeadFrames];
        }
        if(self.arrangedSubviewsCenter.count > 0){
            [self layoutCenterFrames];
        }
        if(self.arrangedSubviewsTail.count > 0){
            [self layoutTailFrames];
        }
    }else if (self.distribution == ATStackDistributionFillEqually){
        [self layoutEqualFrame];
    }
}

-(void)layoutHeadFrames{
    
}

-(void)layoutCenterFrames{
    
}

-(void)layoutTailFrames{
    
}

-(void)layoutEqualFrame{
    
}

@end

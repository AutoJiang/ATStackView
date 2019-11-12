//
//  ATStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "UIView+ATStack.h"
#import "ATStack+Private.h"

@interface ATStack()

@end

@implementation ATStack

- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)inset
{
    self = [super init];
    if (self) {
        self.view = view;
        self->inset = inset;
        self->arrangedSubviewsHead = [[NSMutableArray alloc] init];
        self->arrangedSubviewsCenter = [[NSMutableArray alloc] init];
        self->arrangedSubviewsTail = [[NSMutableArray alloc] init];
        view.stack = self;
    }
    return self;
}

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position{
    switch (position) {
        case ATStackViewPositionHead:
            [self->arrangedSubviewsHead addObject:view];
            break;
        case ATStackViewPositionCenter:
            [self->arrangedSubviewsCenter addObject:view];
            break;
        case ATStackViewPositionTail:
            [self->arrangedSubviewsTail addObject:view];
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
        v = [self->arrangedSubviewsHead lastObject];
    }else if(postion == ATStackViewPositionCenter){
        v = [self->arrangedSubviewsCenter lastObject];
    }else if(postion == ATStackViewPositionTail){
        v = [self->arrangedSubviewsTail lastObject];
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
    if(self->arrangedSubviewsHead.count <= 0 && self->arrangedSubviewsCenter.count <= 0 && self->arrangedSubviewsTail.count <= 0){
        [self addSeparateLine];
        return;
    }
    if (self.distribution == ATStackDistributionFill) {
        if(self->arrangedSubviewsHead.count > 0){
            [self layoutHeadFrames];
        }
        if(self->arrangedSubviewsCenter.count > 0){
            [self layoutCenterFrames];
        }
        if(self->arrangedSubviewsTail.count > 0){
            [self layoutTailFrames];
        }
    }else if (self.distribution == ATStackDistributionFillEqually){
        [self layoutEqualFrame];
    }
    [self addSeparateLine];
}

-(void)addSeparateLine{
    if (self.view.info.separateLine) {
        CGFloat x = self.view.info.separateLine.frame.origin.x;
        CGFloat y = self.view.frame.size.height - self.view.info.separateLine.frame.size.height;
        CGFloat w = self.view.frame.size.width - x;
        CGFloat h = self.view.info.separateLine.frame.size.height;
        self.view.info.separateLine.frame = CGRectMake(x, y, w, h);
        [self.view addSubview: self.view.info.separateLine];
    }
}

- (CGRect)frame{
    CGFloat x = self.view.frame.origin.x + inset.left;
    CGFloat y = self.view.frame.origin.y + inset.top;
    CGFloat w = self.view.frame.size.width - inset.left - inset.right;
    CGFloat h = self.view.frame.size.height - inset.top - inset.bottom;
    return CGRectMake(x, y, w, h);
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

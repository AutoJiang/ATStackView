//
//  ATVerStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATVerStack.h"
#import "UIView+ATStack2.h"
#import "ATStack+Private.h"

@implementation ATVerStack

- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)insets{
    self = [super initWithView:view inset:insets];
    if(self){
        [self setValue:[NSNumber numberWithInt:ATStackConstraintAxisVertical] forKey:@"axis"];
        self.alignment = ATStackAlignmentLeading;
        self.distribution = ATStackDistributionFill;
    }
    return self;
}

-(void)addArrangedSubview:(UIView *)view{
    [self addArrangedSubview:view height:0 isFill:false position:ATStackViewPositionHead];
}

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height{
    [self addArrangedSubview:view height:height isFill:false position:ATStackViewPositionHead];
}

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height isFill:(BOOL)isFill{
    [self addArrangedSubview:view height:height isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview: (UIView*)view isFill:(Boolean)isFill{
    [self addArrangedSubview:view height:0 isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView *)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position{
    [self addArrangedSubview:view position:position];
    view.info.height = height;
    view.info.isFill = isFill;
}

-(CGFloat)layoutCommonFrames:(NSMutableArray* )arrangedSubviews{
    CGFloat width = self.frame.size.width;
    CGFloat y = 0;
    for (int i = 0; i < arrangedSubviews.count; i++) {
        UIView *v = arrangedSubviews[i];
        [v sizeToFit];
        CGFloat w = v.frame.size.width;
        CGFloat x = 0;
        CGFloat h = v.info.height > 0 ? v.info.height: v.frame.size.height;
        if(v.info.isFill){
            x = 0;
            w = width;
        }else{
            if (self.alignment == ATStackAlignmentLeading) {
                x = 0;
            }else if(self.alignment == ATStackAlignmentCenter){
                x = (width - w) / 2.0;
            }else if (self.alignment == ATStackAlignmentTrailing){
                x = width - w;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        y += self.spacing + h + v.info.space;
        [v.stack layoutFrame];
    }
    return y;
}

-(void)layoutHeadFrames{
    [self layoutCommonFrames:self->arrangedSubviewsHead];
}

-(void)layoutCenterFrames{
    CGFloat length = [self layoutCommonFrames:self->arrangedSubviewsCenter];
    CGFloat y = (self.frame.size.height - length)/2;
    [self moveY:y arrangedSubviews:self->arrangedSubviewsCenter];
    
}

-(void)layoutTailFrames{
    CGFloat length = [self layoutCommonFrames:self->arrangedSubviewsTail];
    CGFloat y = self.frame.size.height - length;
    [self moveY:y arrangedSubviews:self->arrangedSubviewsTail];
}

-(void)moveY:(CGFloat)y arrangedSubviews:(NSMutableArray* )arrangedSubviews{
    for (UIView *v in arrangedSubviews) {
        v.frame = CGRectMake(v.frame.origin.x, y + v.frame.origin.y, v.frame.size.width, v.frame.size.height);
    }
}

-(void)layoutEqualFrame{
    long count = self->arrangedSubviewsHead.count;
    CGFloat width = self.frame.size.width;
    CGFloat y = inset.top;
    CGFloat spaceSum = (count - 1)*self.spacing;
    CGFloat h =  (self.frame.size.height - spaceSum)/count;
    for (int i = 0; i < self->arrangedSubviewsHead.count; i++) {
        UIView *v = self->arrangedSubviewsHead[i];
        [v sizeToFit];
        CGFloat w = v.frame.size.width;
        CGFloat x = inset.left;
        if(v.info.isFill){
            x = inset.left;
            w = width;
        }else{
            if (self.alignment == ATStackAlignmentLeading) {
                x = inset.left;
            }else if(self.alignment == ATStackAlignmentCenter){
                x = (width - w) / 2.0;
            }else if (self.alignment == ATStackAlignmentTrailing){
                x = width - w;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        y += self.spacing + h;
        [v.stack layoutFrame];
    }
}

@end

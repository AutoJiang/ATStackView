//
//  ATHorStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/5.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATHorStack.h"
#import "UIView+ATStack2.h"
#import "ATStack+Private.h"

@implementation ATHorStack


- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)inset{
    self = [super initWithView:view inset:inset];
    if(self){
        [self setValue:[NSNumber numberWithInt:ATStackConstraintAxisHorizontal] forKey:@"axis"];
        self.alignment = ATStackAlignmentLeading;
        self.distribution = ATStackDistributionFill;
    }
    return self;
}

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width{
    [self addArrangedSubview:view width:width isFill:false position:ATStackViewPositionHead];
}


-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill{
    [self addArrangedSubview:view width:width isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView*)view isFill:(BOOL)isFill{
    [self addArrangedSubview:view width:0 isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill position:(ATStackViewPosition)position{
    [self addArrangedSubview:view position:position];
    view.info.width = width;
    view.info.isFill = isFill;
}

-(CGFloat)layoutCommonFrames:(NSMutableArray* )arrangedSubviews{
    CGFloat height = self.frame.size.height;
    CGFloat x = 0;
    for (int i = 0; i < arrangedSubviews.count; i++) {
        UIView *v = arrangedSubviews[i];
        [v sizeToFit];
        CGFloat h = v.frame.size.height;
        CGFloat y = 0;
        CGFloat w = v.info.width > 0 ? v.info.width: v.frame.size.width;
        if(v.info.isFill){
            y = 0;
            h = height;
        }else{
            if (self.alignment == ATStackAlignmentLeading) {
                y = 0;
            }else if(self.alignment == ATStackAlignmentCenter){
                y = (height - h) / 2.0;
            }else if (self.alignment == ATStackViewPositionTail){
                y = height - h;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        x += self.spacing + w + v.info.space;
        [v.stack layoutFrame];
    }
    return x;
}

-(void)layoutHeadFrames{
    [self layoutCommonFrames:self->arrangedSubviewsHead];
}

-(void)layoutCenterFrames{
    CGFloat length = [self layoutCommonFrames:self->arrangedSubviewsCenter];
    CGFloat x = (self.frame.size.width - length)/2;
    [self moveX:x arrangedSubviews:self->arrangedSubviewsCenter];
}

-(void)layoutTailFrames{
    CGFloat length = [self layoutCommonFrames:self->arrangedSubviewsTail];
    CGFloat x = self.frame.size.width - length;
    [self moveX:x arrangedSubviews:self->arrangedSubviewsTail];
}

-(void)moveX:(CGFloat)x arrangedSubviews:(NSMutableArray* )arrangedSubviews{
    for (UIView *v in arrangedSubviews) {
        v.frame = CGRectMake(x + v.frame.origin.x, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
    }
}

-(void)layoutEqualFrame{
    long count = self->arrangedSubviewsHead.count;
    CGFloat height = self.frame.size.height;
    CGFloat x = inset.left;
    CGFloat spaceSum = (count - 1)*self.spacing;
    CGFloat w =  (self.frame.size.width - spaceSum)/count;
    
    for (int i = 0; i < self->arrangedSubviewsHead.count; i++) {
        UIView *v = self->arrangedSubviewsHead[i];
        [v sizeToFit];
        CGFloat h = v.frame.size.height;
        CGFloat y = inset.top;
        if(v.info.isFill){
            y = inset.top;
            h = height;
        }else{
            if (self.alignment == ATStackAlignmentLeading) {
                y = inset.top;
            }else if(self.alignment == ATStackAlignmentCenter){
                y = (height - h) / 2.0;
            }else if (self.alignment == ATStackViewPositionTail){
                y = height - h;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        x += self.spacing + w;
        [v.stack layoutFrame];
    }
}

@end

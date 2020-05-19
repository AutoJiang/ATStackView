//
//  ATHorStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/5.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATHorStack.h"
#import "UIView+ATStack.h"
#import "ATStack+Private.h"

@implementation ATHorStack


- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)inset{
    self = [super initWithView:view inset:inset];
    if(self){
        [self setValue:[NSNumber numberWithInt:ATStackConstraintAxisHorizontal] forKey:@"axis"];
        self.alignment = ATStackAlignmentLeading;
    }
    return self;
}

-(CGFloat)layoutCommonFrames:(NSMutableArray* )arrangedSubviews{
    CGFloat height = self.frame.size.height;
    CGFloat x = inset.left;
    
    CGFloat sum = 0;
    for (int i = 0; i < arrangedSubviews.count; i++) {
        UIView *v = arrangedSubviews[i];
        if(v.at_hidden) continue;
        [v sizeToFit];
        sum += v.info.flex;
    }
    if (sum > 0 ) {
        CGFloat remain = self.frame.size.width;
        for (int i = 0; i < arrangedSubviews.count; i++) {
            UIView *v = arrangedSubviews[i];
            if(v.at_hidden) continue;
            if (v.info.flex > 0) {
                remain -= self.spacing + v.info.space;
                continue;
            }
            CGFloat w = v.info.width > 0 ? v.info.width: v.frame.size.width;
            remain -= self.spacing + w + v.info.space;
        }
        if (remain > 0) {
            for (int i = 0; i < arrangedSubviews.count; i++) {
                UIView *v = arrangedSubviews[i];
                if(v.at_hidden) continue;
                if (v.info.flex > 0) {
                    v.info.width = remain * v.info.flex/sum;
                }
            }
        }
    }
    
    for (int i = 0; i < arrangedSubviews.count; i++) {
        UIView *v = arrangedSubviews[i];
        if(v.at_hidden) continue;
        CGFloat h = v.info.height > 0 ? v.info.height: v.frame.size.height;
        CGFloat y = inset.top;
        CGFloat w = v.info.width > 0 ? v.info.width: v.frame.size.width;
        if(v.info.multipliedBy){
            y = inset.top;
            h = height * v.info.multipliedBy;
        }else{
            if ((v.info.alignment != ATStackAlignmentAuto && v.info.alignment == ATStackAlignmentLeading) ||
                (v.info.alignment == ATStackAlignmentAuto && self.alignment == ATStackAlignmentLeading)){
                y = inset.top;
            }else if ((v.info.alignment != ATStackAlignmentAuto && v.info.alignment == ATStackAlignmentCenter) ||
                      (v.info.alignment == ATStackAlignmentAuto && self.alignment == ATStackAlignmentCenter)){
                y = (height - h) / 2.0 + inset.top;
            }else if ((v.info.alignment != ATStackAlignmentAuto && v.info.alignment == ATStackAlignmentTrailing) ||
                      (v.info.alignment == ATStackAlignmentAuto && self.alignment == ATStackAlignmentTrailing)){
                y = height - h + inset.top;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        if ([self.view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView*)self.view).contentSize = CGSizeMake(CGRectGetMaxX(v.frame) + self.spacing + v.info.space, CGRectGetMaxY(v.frame) + self.spacing + v.info.space);
        }else{
            if (CGRectGetMaxY(v.frame) > self.view.frame.size.height  && self.view.info.height == 0) {
                self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, CGRectGetMaxY(v.frame));
            }
            if (CGRectGetMaxX(v.frame) + self.spacing + v.info.space  > self.view.frame.size.width  && self.view.info.width == 0) {
                self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, CGRectGetMaxX(v.frame) + self.spacing + v.info.space, self.view.frame.size.height);
            }
        }

        [v.stack layoutFrame];
        x += self.spacing + v.frame.size.width + v.info.space;
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
    CGFloat x = self.frame.size.width - length + inset.left;
    [self moveX:x arrangedSubviews:self->arrangedSubviewsTail];
}

-(void)moveX:(CGFloat)x arrangedSubviews:(NSMutableArray* )arrangedSubviews{
    for (UIView *v in arrangedSubviews) {
        v.frame = CGRectMake(x + v.frame.origin.x, v.frame.origin.y, v.frame.size.width, v.frame.size.height);
    }
}
@end

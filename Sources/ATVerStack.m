//
//  ATVerStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATVerStack.h"
#import "UIView+ATStack.h"
#import "ATStack+Private.h"

@implementation ATVerStack

- (instancetype)initWithView:(UIView*)view inset:(UIEdgeInsets)insets {
    self = [super initWithView:view inset:insets];
    if(self){
        [self setValue:[NSNumber numberWithInt:ATStackConstraintAxisVertical] forKey:@"axis"];
        self.alignment = ATStackAlignmentLeading;
    }
    return self;
}

- (CGFloat)layoutCommonFrames:(NSMutableArray* )arrangedSubviews {
    CGFloat width = self.frame.size.width;
    CGFloat y = inset.top;
    CGFloat sum = 0;
    for (int i = 0; i < arrangedSubviews.count; i++) {
        UIView *v = arrangedSubviews[i];
        if(v.at_hidden) continue;
        if (![v isKindOfClass:[UIImageView class]]) {
            [v sizeToFit];
        }
        sum += v.info.flex;
    }
    if (sum > 0 ) {
        CGFloat remain = self.frame.size.height;
        for (int i = 0; i < arrangedSubviews.count; i++) {
            UIView *v = arrangedSubviews[i];
            if(v.at_hidden) continue;
            if (v.info.flex > 0) {
                remain -= self.spacing + v.info.space;
                continue;
            }
            CGFloat h = v.info.height > 0 ? v.info.height: v.frame.size.height;
            remain -= self.spacing + h + v.info.space;
        }
        if (remain > 0) {
            for (int i = 0; i < arrangedSubviews.count; i++) {
                UIView *v = arrangedSubviews[i];
                if(v.at_hidden) continue;
                if (v.info.flex > 0) {
                    v.info.height = remain * v.info.flex/sum;
                }
            }
        }
    }
    for (int i = 0; i < arrangedSubviews.count; i++) {
        UIView *v = arrangedSubviews[i];
        if(v.at_hidden) continue;
        CGFloat w = v.info.width > 0 ? v.info.width: v.frame.size.width;
        CGFloat x = inset.left;
        CGFloat h = v.info.height > 0 ? v.info.height: v.frame.size.height;
        if (v.info.multipliedBy) {
            x = inset.left;
            w = width*v.info.multipliedBy;
        }else {
            if ((v.info.alignment != ATStackAlignmentAuto && v.info.alignment == ATStackAlignmentLeading) ||
                (v.info.alignment == ATStackAlignmentAuto && self.alignment == ATStackAlignmentLeading)) {
                x = inset.left;
            } else if ((v.info.alignment != ATStackAlignmentAuto && v.info.alignment == ATStackAlignmentCenter) ||
                      (v.info.alignment == ATStackAlignmentAuto && self.alignment == ATStackAlignmentCenter)) {
                x = (width - w) / 2.0 + inset.left;
            } else if ((v.info.alignment != ATStackAlignmentAuto && v.info.alignment == ATStackAlignmentTrailing) ||
                      (v.info.alignment == ATStackAlignmentAuto && self.alignment == ATStackAlignmentTrailing)) {
                x = width - w + inset.left;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        if ([self.view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView*)self.view).contentSize = CGSizeMake(CGRectGetMaxX(v.frame) + self.spacing + v.info.space, CGRectGetMaxY(v.frame) + self.spacing + v.info.space);
        } else {
            if (CGRectGetMaxY(v.frame) + self.spacing + v.info.space > self.view.frame.size.height && self.view.info.height == 0) {
                self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, CGRectGetMaxY(v.frame) + self.spacing + v.info.space);
            }
            if (CGRectGetMaxX(v.frame) > self.view.frame.size.width && self.view.info.width == 0) {
                self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, CGRectGetMaxX(v.frame), self.view.frame.size.height);
            }
        }
        [v.stack layoutFrame];
        y += self.spacing + v.frame.size.height + v.info.space;
    }
    return y;
}

- (void)layoutHeadFrames {
    [self layoutCommonFrames:self->arrangedSubviewsHead];
}

- (void)layoutCenterFrames {
    CGFloat length = [self layoutCommonFrames:self->arrangedSubviewsCenter];
    CGFloat y = (self.frame.size.height - length + inset.top) / 2 ;
    [self moveY:y arrangedSubviews:self->arrangedSubviewsCenter];
}

- (void)layoutTailFrames {
    CGFloat length = [self layoutCommonFrames:self->arrangedSubviewsTail];
    CGFloat y = self.frame.size.height - length + inset.top;
    [self moveY:y arrangedSubviews:self->arrangedSubviewsTail];
}

- (void)moveY:(CGFloat)y arrangedSubviews:(NSMutableArray* )arrangedSubviews {
    for (UIView *v in arrangedSubviews) {
        v.frame = CGRectMake(v.frame.origin.x, y + v.frame.origin.y, v.frame.size.width, v.frame.size.height);
    }
}

@end

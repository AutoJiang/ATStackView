//
//  ATStackView.m
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/15.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import "ATStackView.h"

@implementation ATStackView

-(void)addArrangedSubview:(UIView *)view{
    [self addArrangedSubview:view position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position{
    switch (position) {
        case ATStackViewPositionHead:
            [self addArrangedPositionHeadSubview:view];
            break;
        case ATStackViewPositionTail:
            [self addArrangedPositionTailSubview:view];
            break;
        default:
            break;
    }
}

-(void)addArrangedPositionHeadSubview:(UIView*)view{
    if (!self.tailArray.count) {
        [super addArrangedSubview:view];
        return;
    }
    long index = self.subviews.count - self.tailArray.count - 1;
    if (index >= 0) {
        [self insertArrangedSubview:view atIndex: index];
    }
}

-(void)addArrangedPositionTailSubview:(UIView*)view{
    if (self.tailArray.count == 0) {
        UIStackView *stack = [UIStackView new];
        [self addArrangedSubview:stack];
        [stack setContentHuggingPriority:0 forAxis:UILayoutConstraintAxisHorizontal];
        [stack setContentHuggingPriority:0 forAxis:UILayoutConstraintAxisVertical];
    }
    long index = self.arrangedSubviews.count - self.tailArray.count;
    if (index >= 0) {
        [self insertArrangedSubview:view atIndex:index];
    }
    [self.tailArray addObject:view];
}

#pragma mark - userInteraction
//防止事件响应链被拦截
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self]) {
        return nil;
    }
    return view;
}

@end

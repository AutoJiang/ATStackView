//
//  UIView+ATStack.m
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/9.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import "UIView+ATStack.h"
#import <objc/runtime.h>

#define kATHidden @"kATHidden"
#define kLastAlpha @"kLastAlpha"
#define kATWidth @"kATWidth"
#define kATHeight @"kATHeight"

@implementation UIView(Stack)

-(ATVerStackView *)addStackVer{
    return [self addStackVerWithInset:UIEdgeInsetsZero];
}

-(ATHorStackView *)addStackHor{
    return [self addStackHorWithInset:UIEdgeInsetsZero];
}

-(ATHorStackView *)addStackHorCenter{
    return [self addStackHorCenterWithInset:UIEdgeInsetsZero];
}

-(ATVerStackView *)addStackVerCenter{
    return [self addStackVerCenterWithInset:UIEdgeInsetsZero];
}

-(ATVerStackView *)addStackVerWithInset:(UIEdgeInsets)inset{
    ATVerStackView *stack = [ATVerStackView getStackVer];
    [self addStackView:stack];
    [self addStackVerConstraintWithStack:stack inset:inset isNeedPriority:true];
    return stack;
}

-(ATHorStackView *)addStackHorWithInset:(UIEdgeInsets)inset{
    ATHorStackView *stack = [ATHorStackView getStackHor];
    [self addStackView:stack];
    [self addStackHorConstraintWithStack:stack inset:inset isNeedPriority:true];
    return stack;
}

-(ATHorStackView *)addStackHorEqual{
    return [self addStackHorEqualWithInset:UIEdgeInsetsZero];
}

-(ATVerStackView *)addStackVerEqual{
    return [self addStackVerEqualWithInset:UIEdgeInsetsZero];
}

-(ATHorStackView *)addStackHorEqualWithInset:(UIEdgeInsets)inset{
    ATHorStackView *stack = [ATHorStackView getStackHorEqueal];
    [self addStackView:stack];
    [self addStackHorConstraintWithStack:stack inset:inset isNeedPriority:false];
    return stack;
}

-(ATVerStackView *)addStackVerEqualWithInset:(UIEdgeInsets)inset{
    ATVerStackView *stack = [ATVerStackView getStackVerEqueal];
    [self addStackView:stack];
    [self addStackVerConstraintWithStack:stack inset:inset isNeedPriority:false];
    return stack;
}

-(ATHorStackView *)addStackHorCenterWithInset:(UIEdgeInsets)inset{
    ATHorStackView *stack = [ATHorStackView getStackHorCenter];
    [self addStackView:stack];
    [self addStackCenterConstraintWithStack:stack inset:inset];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    return stack;
}

-(ATVerStackView *)addStackVerCenterWithInset:(UIEdgeInsets)inset{
    ATVerStackView *stack = [ATVerStackView getStackVerCenter];
    [self addStackView:stack];
    [self addStackCenterConstraintWithStack:stack inset:inset];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    return stack;
}

-(void)addStackView:(UIView*)stackView{
    [self addSubview:stackView];
    stackView.translatesAutoresizingMaskIntoConstraints = false;
}

-(void)addStackVerConstraintWithStack:(ATVerStackView*)stack inset:(UIEdgeInsets)inset isNeedPriority:(BOOL)isNeedPriority{
    if ([self isMemberOfClass:[UIScrollView class]]) {
        //        [stack mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self);
        //            make.width.equalTo(self);
        //        }];
        [self addConstraints:
         @[
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]
           ]];
        return;
    }
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-inset.bottom];
    if (isNeedPriority) {
        [bottomConstraint setPriority:100];
    }
    [self addConstraints:
     @[
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:inset.top],
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:inset.left],
       bottomConstraint,
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-inset.right]
       ]];
}

-(void)addStackHorConstraintWithStack:(ATHorStackView*)stack inset:(UIEdgeInsets)inset isNeedPriority:(BOOL)isNeedPriority{
    if ([self isMemberOfClass:[UIScrollView class]]) {
        [self addConstraints:
         @[
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
           [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]
           ]];
        return;
    }
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-inset.right];
    if (isNeedPriority) {
        [rightConstraint setPriority:100];
    }
    [self addConstraints:
     @[
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:inset.top],
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:inset.left],
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-inset.bottom],
       rightConstraint
       ]];
}

-(void)addStackCenterConstraintWithStack:(ATStackView*)stack inset:(UIEdgeInsets)inset{
    [self addConstraints:
     @[
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant: inset.left - inset.right],
       [NSLayoutConstraint constraintWithItem:stack attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant: inset.top - inset.bottom],
       ]];
}

-(UIView*)addLineSeparateWithLelfPadding:(CGFloat)leftPadding{
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addStackView:line];
    [self addConstraints:
     @[
       [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:leftPadding],
       [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
       [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
      [NSLayoutConstraint constraintWithItem:line attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5]
       ]];
    return line;
}

-(UIView*)addLineSeparate{
    return [self addLineSeparateWithLelfPadding:0];
}


#pragma mark - about hiddenWithoutLayout
-(void)setAt_hidden:(BOOL)hidden{
    NSNumber *value = objc_getAssociatedObject(self, kATHidden);
    if ([value boolValue] == hidden) {
        return;
    }
    objc_setAssociatedObject(self, kATHidden, @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (hidden) {
        objc_setAssociatedObject(self, kLastAlpha, @(self.alpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        self.alpha = 0;
    }else{
        NSNumber *lastAlpha = objc_getAssociatedObject(self, kLastAlpha);
        if (lastAlpha) {
            self.alpha = [lastAlpha floatValue];
        }
    }
}

-(BOOL)at_hidden{
    NSNumber *value = objc_getAssociatedObject(self, kATHidden);
    return [value boolValue];
}

-(void)setAt_width:(CGFloat)width{
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:width];
    [self addConstraint:widthConstraint];
    objc_setAssociatedObject(self, kATWidth, @(width), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)setAt_height:(CGFloat)height{
    self.translatesAutoresizingMaskIntoConstraints = false;
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:height];
    [self addConstraint:heightConstraint];
    objc_setAssociatedObject(self, kATHeight, @(height), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CGFloat)at_width{
    NSNumber *width = objc_getAssociatedObject(self, kATWidth);
    return [width doubleValue];
}

-(CGFloat)at_height{
    NSNumber *height = objc_getAssociatedObject(self, kATHeight);
    return [height doubleValue];
}
@end

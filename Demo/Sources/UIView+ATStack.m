//
//  UIView+ATStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "UIView+ATStack.h"
#import "ATStack+Private.h"
#import <objc/runtime.h>

static const void *kATStackAssociatedKey = &kATStackAssociatedKey;
static const void *kATStackInfoAssociatedKey = &kATStackInfoAssociatedKey;

@implementation UIView(ATStack)

- (ATStack*)stack {
    ATStack *stack = objc_getAssociatedObject(self, kATStackAssociatedKey);
    return stack;
}

- (void)setStack:(ATStack * _Nonnull)stack {
    if (stack) {
        objc_setAssociatedObject(self, kATStackAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (ATStackInfo*)info {
    ATStackInfo *stack = objc_getAssociatedObject(self, kATStackInfoAssociatedKey);
    if(!stack){
        stack = [[ATStackInfo alloc] init];
        objc_setAssociatedObject(self, kATStackInfoAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return stack;
}

- (ATStack *)superStack {
    if (self.superview && self.superview.stack) {
        return self.superview.stack;
    }
    return nil;
}

- (ATVerStack *)getStackVer {
    return [self getStackVerWithInset:UIEdgeInsetsZero];
}

- (ATVerStack *)getStackVerWithInset:(UIEdgeInsets)inset {
    return [[ATVerStack alloc] initWithView:self inset:inset];
}

- (ATHorStack *)getStackHor {
    return [self getStackHorWithInset:UIEdgeInsetsZero];
}

- (ATHorStack *)getStackHorWithInset:(UIEdgeInsets)inset {
    return [[ATHorStack alloc] initWithView:self inset:inset];
}

- (UIView *)addLineSeparate {
    return [self addLineSeparateWithLelfPadding:0 rightPadding:0];
}

- (UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding rightPadding: (CGFloat)rightPadding {
    UIView *separateLine =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 1.0/[UIScreen mainScreen].scale)];
    separateLine.backgroundColor = UIColor.groupTableViewBackgroundColor;
    self.info.separateLine = separateLine;
    self.info.separateLineLeftPadding = leftPadding;
    self.info.separateLineRightPadding = rightPadding;
    return separateLine;
}

- (UIView *)addLineSeparateWithRightPadding:(CGFloat)rightPadding {
    return [self addLineSeparateWithLelfPadding:0 rightPadding:rightPadding];
}

- (UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding {
    return [self addLineSeparateWithLelfPadding:leftPadding rightPadding:0];
}

- (UIView*)at_makeFlexBox:(void(^)(ATStackFlexBoxMaker *))block {
    ATStackFlexBoxMaker *maker = [[ATStackFlexBoxMaker alloc] initWithView:self];
    block(maker);
    return [self setStackNeedLayout];
}

- (UIView *)setAt_hidden:(BOOL)hidden {
    self.hidden = hidden;
    self.info.hidden = hidden;
    return [self setStackNeedLayout];
}

- (BOOL)at_hidden {
    return self.info.hidden;
}

- (UIView *)setAt_width:(CGFloat)width {
    self.info.width = width;
    return [self setStackNeedLayout];
}

- (CGFloat)at_width {
    return self.info.width;
}

- (UIView *)setAt_height:(CGFloat)height {
    self.info.height = height;
    return [self setStackNeedLayout];
}

- (CGFloat)at_height {
    return self.info.height;
}

- (UIView*)setAt_flex:(CGFloat)flex {
    self.info.flex = flex;
    return [self setStackNeedLayout];
}

- (CGFloat)at_flex {
    return self.info.flex;
}

- (UIView*)setAt_space:(CGFloat)space {
    self.info.space = space;
    return [self setStackNeedLayout];
}

- (CGFloat)at_space {
    return self.info.space;
}

- (UIView*)setAt_multipliedBy:(CGFloat)multipliedBy {
    multipliedBy = multipliedBy > 1 ? 1 : multipliedBy;
    multipliedBy = multipliedBy < 1 ? 0 : multipliedBy;
    self.info.multipliedBy = multipliedBy;
    return [self setStackNeedLayout];
}

- (CGFloat)at_multipliedBy {
    return self.info.multipliedBy;
}

- (UIView*)setAt_alignment:(ATStackAlignment)alignment {
    self.info.alignment = alignment;
    return [self setStackNeedLayout];
}

- (UIView *)setStackNeedLayout {
    self.superview.stack.isNeedLayout = true;
    return self;
}

- (ATStackAlignment)at_alignment {
    return self.info.alignment;
}

@end

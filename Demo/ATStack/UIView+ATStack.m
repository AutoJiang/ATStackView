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

-(ATStack*)stack{
    ATStack *stack = objc_getAssociatedObject(self, kATStackAssociatedKey);
    return stack;
}

-(void)setStack:(ATStack * _Nonnull)stack{
    if (stack) {
        objc_setAssociatedObject(self, kATStackAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

-(ATStackInfo*)info{
    ATStackInfo *stack = objc_getAssociatedObject(self, kATStackInfoAssociatedKey);
    if(!stack){
        stack = [[ATStackInfo alloc] init];
        objc_setAssociatedObject(self, kATStackInfoAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return stack;
}

-(ATVerStack *)getStackVer{
    return [self getStackVerWithInset:UIEdgeInsetsZero];
}

-(ATVerStack *)getStackVerWithInset:(UIEdgeInsets)inset{
    return [[ATVerStack alloc] initWithView:self inset:inset];
}

-(ATHorStack *)getStackHor{
    return [self getStackHorWithInset:UIEdgeInsetsZero];
}

-(ATHorStack *)getStackHorWithInset:(UIEdgeInsets)inset{
    return [[ATHorStack alloc] initWithView:self inset:inset];
}

-(ATHorStack*)getStackHorEqual{
    return [self getStackHorEqualWithInset:UIEdgeInsetsZero];
}

-(ATHorStack *)getStackHorEqualWithInset:(UIEdgeInsets)inset{
    ATHorStack *stack = [[ATHorStack alloc] initWithView:self inset:inset];
    stack.distribution = ATStackDistributionFillEqually;
    return stack;
}

-(ATVerStack *)getStackVerEqual{
    return [self getStackVerEqualWithInset:UIEdgeInsetsZero];
}

-(ATVerStack *)getStackVerEqualWithInset:(UIEdgeInsets)inset{
    ATVerStack *stack = [[ATVerStack alloc] initWithView:self inset:inset];
    stack.distribution = ATStackDistributionFillEqually;
    return stack;
}

-(UIView *)addLineSeparate{
    return [self addLineSeparateWithLelfPadding:0];
}

-(UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding{
    
    UIView *separateLine =[[UIView alloc]initWithFrame:CGRectMake(leftPadding, 0, 0, 1.0/[UIScreen mainScreen].scale)];
    separateLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.info.separateLine = separateLine;
    return separateLine;
}

-(void)setAt_hidden:(BOOL)hidden{
    self.hidden = hidden;
    self.info.hidden = hidden;
}

-(BOOL)at_hidden{
    return self.info.hidden;
}

-(void)setAt_width:(CGFloat)width{
    self.info.width = width;
}

-(CGFloat)at_width{
    return self.info.width;
}

-(void)setAt_height:(CGFloat)height{
    self.info.height = height;
}

-(CGFloat)at_height{
    return self.info.height;
}

@end

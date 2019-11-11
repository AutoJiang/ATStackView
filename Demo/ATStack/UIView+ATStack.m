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


@end

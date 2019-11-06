//
//  UIView+ATStack2.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "UIView+ATStack2.h"
#import <objc/runtime.h>

static const void *kATStackAssociatedKey = &kATStackAssociatedKey;
static const void *kATStackInfoAssociatedKey = &kATStackInfoAssociatedKey;

@implementation UIView(ATStack2)

-(ATStack*)stack{
    ATStack *stack = objc_getAssociatedObject(self, kATStackAssociatedKey);
    if(!stack){
        stack = [[ATStack alloc] initWithView: self];
        objc_setAssociatedObject(self, kATStackAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return stack;
}

-(void)setStack:(ATStack * _Nonnull)stack{
    objc_setAssociatedObject(self, kATStackAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(ATStackInfo*)info{
    ATStackInfo *stack = objc_getAssociatedObject(self, kATStackInfoAssociatedKey);
    if(!stack){
        stack = [[ATStackInfo alloc] init];
        objc_setAssociatedObject(self, kATStackInfoAssociatedKey, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return stack;
}


-(ATVerStack *)addStackVer{
    ATVerStack *stack = [[ATVerStack alloc] initWithView:self];
    return stack;
}


@end
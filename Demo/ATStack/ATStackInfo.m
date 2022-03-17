//
//  ATStackInfo.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATStackInfo.h"
@implementation ATStackInfo

- (instancetype)init {
    self = [super init];
    if (self) {
        _height = 0;
        _width = 0;
        _multipliedBy = 0;
        _space = 0;
        _hidden = false;
        _flex = 0;
        _alignment = ATStackAlignmentAuto;
        _separateLineLeftPadding = 0;
        _separateLineRightPadding = 0;
    }
    return self;
}

- (void)valueDidChange {
    if ([self.delegate respondsToSelector:@selector(stackInfoValueDidChange:)]) {
        [self.delegate stackInfoValueDidChange:self];
    }
}

- (void)setHeight:(CGFloat)height {
    if (_height != height) {
        _height = height;
        [self valueDidChange];
    }
}

- (void)setWidth:(CGFloat)width {
    if (_width != width) {
        _width = width;
        [self valueDidChange];
    }
}

- (void)setMultipliedBy:(CGFloat)multipliedBy {
    if (_multipliedBy != multipliedBy) {
        _multipliedBy = multipliedBy;
        [self valueDidChange];
    }
}

- (void)setSpace:(CGFloat)space {
    if (_space != space) {
        _space = space;
        [self valueDidChange];
    }
}

- (void)setHidden:(BOOL)hidden {
    if (_height != hidden) {
        _hidden =  hidden;
        [self valueDidChange];
    }
}

- (void)setFlex:(CGFloat)flex {
    if (_flex != flex) {
        _flex = flex;
        [self valueDidChange];
    }
}

- (void)setAlignment:(ATStackAlignment)alignment {
    if (_alignment != alignment) {
        _alignment = alignment;
        [self valueDidChange];
    }
}

@end

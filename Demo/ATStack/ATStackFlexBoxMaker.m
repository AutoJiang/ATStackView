//
//  ATStackFlexBoxMaker.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATStackFlexBoxMaker.h"

@interface ATStackFlexBoxMaker()

@property(nonatomic, weak) UIView *view;

@end

@implementation ATStackFlexBoxMaker

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

-(ATStackFlexBoxMaker *(^)(CGFloat))flex{
    __weak typeof(self) wself = self;
    ATStackFlexBoxMaker *(^result)(CGFloat) = ^(CGFloat value){
        wself.view.info.flex = value;
        return wself;
    };
    return result;
}

-(ATStackFlexBoxMaker *(^)(CGFloat))width{
    __weak typeof(self) wself = self;
    ATStackFlexBoxMaker *(^result)(CGFloat) = ^(CGFloat value){
        wself.view.info.width = value;
        return wself;
    };
    return result;
}

-(ATStackFlexBoxMaker *(^)(CGFloat))height{
    __weak typeof(self) wself = self;
    ATStackFlexBoxMaker *(^result)(CGFloat) = ^(CGFloat value){
        wself.view.info.height = value;
        return wself;
    };
    return result;
}

-(ATStackFlexBoxMaker *(^)(CGFloat))space{
    __weak typeof(self) wself = self;
    ATStackFlexBoxMaker *(^result)(CGFloat) = ^(CGFloat value){
        wself.view.info.space = value;
        return wself;
    };
    return result;
}

-(ATStackFlexBoxMaker *(^)(CGFloat))multipliedBy{
    __weak typeof(self) wself = self;
    ATStackFlexBoxMaker *(^result)(CGFloat) = ^(CGFloat value){
        wself.view.info.multipliedBy = value;
        return wself;
    };
    return result;
}

-(ATStackFlexBoxMaker *(^)(ATStackAlignment))alignment{
    __weak typeof(self) wself = self;
    ATStackFlexBoxMaker *(^result)(ATStackAlignment) = ^(ATStackAlignment value){
        wself.view.info.alignment = value;
        return wself;
    };
    return result;
}



@end

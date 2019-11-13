//
//  SecondExampleViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#import "SecondExampleViewController.h"
#import "UIView+ATStack.h"

@interface SecondExampleViewController ()

@end

@implementation SecondExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ATVerStack *stack = [self.view getStackVer];
    stack.spacing = 20;
    for(int i = 0; i < 3; i++) {
        UIView *view = [UIView new];
        ATHorStack *horStack = [view getStackHorEqualWithInset:UIEdgeInsetsMake(10, 20, 10, 20)];
        horStack.spacing = 20;
        for (int j = 0; j < 3; j++) {
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [horStack addArrangedSubview:view isFill:true];
        }
        [stack addArrangedSubview:view height:80 isFill:true position:ATStackViewPositionCenter];
    }
    [stack layoutFrame];
}

@end

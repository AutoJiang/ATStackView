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
    ATVerStackView *stack = [self.view addStackVerCenter];
    stack.spacing = 20;
    for (int i = 0; i < 3; i++) {
        UIView *view = [UIView new];
        ATHorStackView *horStack = [view addStackHorEqualWithInset:UIEdgeInsetsMake(0, 20, 0, 20)];
        horStack.spacing = 20;
        for (int j = 0; j < 3; j++) {
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [horStack addArrangedSubview:view];
        }
        [stack addArrangedSubview:view height:60 isFill:true];
    }
}

@end

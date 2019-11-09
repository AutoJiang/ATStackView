//
//  SecondExampleViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#import "SecondExampleViewController.h"
#import "UIView+ATStack2.h"
@interface SecondExampleViewController ()

@end

@implementation SecondExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ATVerStack *stack = [self.view addStackVerCenter];
    stack.spacing = 20;
    for(int i = 0; i < 3; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor greenColor];
        ATHorStack *horStack = [view addStackHorEqualWithInset:UIEdgeInsetsMake(0, 20, 0, 20)];
        horStack.spacing = 20;
        for (int j = 0; j < 3; j++) {
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor redColor];
            [horStack addArrangedSubview:view isFill:true];
        }
//        [horStack layoutFrame];
        [stack addArrangedSubview:view height:60 isFill:true];
    }
    [stack layoutFrame];
}

@end

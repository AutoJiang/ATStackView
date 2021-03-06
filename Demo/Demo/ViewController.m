//
//  ViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ATStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.alwaysBounceVertical = true;
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    ATVerStack *stack = [scrollView getStackVer];
    [stack addSpacing:10];
    [stack addArrangedSubview:[self createCellWithTitle:@"朋友圈" leftImageName:@"shareMoment" isLast:true]];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"扫一扫" leftImageName:@"shareMoment" isLast:false]];
    [stack addArrangedSubview:[self createCellWithTitle:@"摇一摇" leftImageName:@"shareMoment" isLast:true]];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"看一看" leftImageName:@"shareMoment" isLast:false]];
    [stack addArrangedSubview:[self createCellWithTitle:@"搜一搜" leftImageName:@"shareMoment" isLast:true]];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"附近的人" leftImageName:@"shareMoment" isLast:false]];
    [stack addArrangedSubview:[self createCellWithTitle:@"漂流瓶" leftImageName:@"shareMoment" isLast:true]];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"购物" leftImageName:@"shareMoment" isLast:false]];
    [stack addArrangedSubview:[self createCellWithTitle:@"游戏" leftImageName:@"shareMoment" isLast:true]];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"小程序" leftImageName:@"shareMoment" isLast:true]];;
}

-(UIView*)createCellWithTitle:(NSString*)title leftImageName:(NSString*)imageName isLast:(BOOL)isLast{
    UIControl *control = [UIControl new];
    [control at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(40).multipliedBy(1);
    }];
    control.backgroundColor = [UIColor whiteColor];
    ATHorStack *stack = [control getStackHorWithInset:UIEdgeInsetsMake(0, 12, 0, 0)];
    stack.spacing = 10;
    stack.alignment = ATStackAlignmentCenter;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [stack addArrangedSubview:imageView];
    UILabel *label = [UILabel new];
    label.text = title;
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    [stack addArrangedSubview:label];
    UIImageView *leftArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chevron"]];
    [stack addArrangedSubview:leftArrow position:ATStackViewPositionTail];
    if (!isLast) {
        [control addLineSeparateWithLelfPadding:10];
    }
    control.accessibilityIdentifier = title;
    [control addTarget:self action:@selector(cellOnclick:) forControlEvents:UIControlEventTouchUpInside];
    return control;
}

-(void)cellOnclick:(UIControl*)control{
    NSLog(@"%@ on click!",control.accessibilityIdentifier);
}


@end

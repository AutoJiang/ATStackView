//
//  ViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ATStack2.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.alwaysBounceVertical = true;
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.view  = scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ATVerStack *stack = [self.view addStackVer];
    [stack addSpacing:10];
    [stack addArrangedSubview:[self createCellWithTitle:@"朋友圈" leftImageName:@"shareMoment" isLast:true] height:40 isFill:true];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"扫一扫" leftImageName:@"shareMoment" isLast:false] height:40 isFill:true];
    [stack addArrangedSubview:[self createCellWithTitle:@"摇一摇" leftImageName:@"shareMoment" isLast:true] height:40 isFill:true];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"看一看" leftImageName:@"shareMoment" isLast:false] height:40 isFill:true];
    [stack addArrangedSubview:[self createCellWithTitle:@"搜一搜" leftImageName:@"shareMoment" isLast:true] height:40 isFill:true];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"附近的人" leftImageName:@"shareMoment" isLast:false] height:40 isFill:true];
    [stack addArrangedSubview:[self createCellWithTitle:@"漂流瓶" leftImageName:@"shareMoment" isLast:true] height:40 isFill:true];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"购物" leftImageName:@"shareMoment" isLast:false] height:40 isFill:true];
    [stack addArrangedSubview:[self createCellWithTitle:@"游戏" leftImageName:@"shareMoment" isLast:true] height:40 isFill:true];
    [stack addSpacing:14];
    [stack addArrangedSubview:[self createCellWithTitle:@"小程序" leftImageName:@"shareMoment" isLast:true] height:40 isFill:true];;
    [stack layoutFrame];
}

-(UIView*)createCellWithTitle:(NSString*)title leftImageName:(NSString*)imageName isLast:(BOOL)isLast{
    UIControl *control = [UIControl new];
    control.backgroundColor = [UIColor whiteColor];
    ATHorStack *stack = [control addStackHorWithInset:UIEdgeInsetsMake(0, 12, 0, 12)];
    stack.spacing = 10;
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
//        [control addLineSeparateWithLelfPadding:10];
    }
    control.accessibilityIdentifier = title;
    [control addTarget:self action:@selector(cellOnclick:) forControlEvents:UIControlEventTouchUpInside];
    return control;
}

-(void)cellOnclick:(UIControl*)control{
    NSLog(@"%@ on click!",control.accessibilityIdentifier);
}


@end

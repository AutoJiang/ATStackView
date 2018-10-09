//
//  FirstExampleViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#import "FirstExampleViewController.h"
#import "UIView+ATStack.h"
#define RandomColor [UIColor colorWithRed: (random()%256)/255.0 green:(random()%256)/255.0 blue:(random()%256)/255.0 alpha:1.0]

@interface FirstExampleViewController ()

@property(nonatomic, strong) ATVerStackView *stack;

@end

@implementation FirstExampleViewController

//-(void)loadView{
//    UIScrollView *scrollView = [UIScrollView new];
//    scrollView.alwaysBounceVertical = true;
//    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    scrollView.contentSize = [UIScreen mainScreen].bounds.size;
//    self.view  = scrollView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    ATVerStackView *verStack = [self.view addStackVerWithInset:UIEdgeInsetsMake(100, 0, 100, 0)];
    self.stack = [self createExampleStackView];
    [verStack addArrangedSubview:self.stack isFill:true];
    [verStack addArrangedSubview:[self createControlsView] height:40 isFill:true position:ATStackViewPositionTail];
}

-(ATVerStackView*)createExampleStackView{
    ATVerStackView *stack = [ATVerStackView getStackVer];
    stack.spacing = 10;
    UIView *view1 = [UIView new];
    view1.backgroundColor = RandomColor;
    [stack addArrangedSubview:view1 height:30 isFill:true];
    [stack addSpacing:30];
    UIView *view2 = [UIView new];
    view2.backgroundColor = RandomColor;
    [stack addArrangedSubview:view2 height:40 isFill:true];
    UIView *view3 = [UIView new];
    view3.backgroundColor = RandomColor;
    [stack addArrangedSubview:view3 height:50 isFill:true];
    UILabel *label1 = [UILabel new];
    label1.text = @"label1 ";
    label1.textColor = RandomColor;
    label1.backgroundColor = RandomColor;
    //不设置高度,isFill = false。自适应大小
    [stack addArrangedSubview:label1];
    UILabel *label2 = [UILabel new];
    label2.text = @"label2";
    label2.textColor = RandomColor;
    label2.backgroundColor = RandomColor;
    label2.textAlignment = NSTextAlignmentCenter;
    //label2 不设置高度,isFill = true， 宽度拉伸填满"
    [stack addArrangedSubview:label2 isFill:true];
    UILabel *label3 = [UILabel new];
    label3.text = @"label3";
    label3.textColor = RandomColor;
    label3.backgroundColor = RandomColor;
    //label3 设置高度，isFill = false，高度自定义，宽度自适应"
    [stack addArrangedSubview:label3 height:50 isFill:false];
    return stack;
}

-(UIView*)createControlsView{
    ATHorStackView *stack = [ATHorStackView getStackHorEqueal];
    stack.spacing = 3.0;
    UIButton *button1 = [UIButton new];
    [button1 setTitle:@"Leading" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:button1];
    button1.tag = UIStackViewAlignmentLeading;
    UIButton *button2 = [UIButton new];
    [button2 setTitle:@"Center" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor] ;
    [button2 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:button2];
    button2.tag = UIStackViewAlignmentCenter;
    UIButton *button3 = [UIButton new];
    [button3 setTitle:@"Trailing" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor blueColor] ;
    [button3 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [stack addArrangedSubview:button3];
    button3.tag = UIStackViewAlignmentTrailing;
    return stack;
}

-(void)selectedAction:(UIButton*)button{
    self.stack.alignment = button.tag;
}

@end

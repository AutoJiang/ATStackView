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

@property(nonatomic, strong) ATVerStack* verStack;
@property(nonatomic, strong) ATHorStack* horStack;
@property(nonatomic, strong) UILabel *label2;
@property(nonatomic, strong) UILabel *label4;
@property(nonatomic, strong) UIView *view2;
@end

@implementation FirstExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.alwaysBounceVertical = true;
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    ATVerStack *stack = [scrollView getStackVerWithInset:UIEdgeInsetsMake(50, 20, 0, 20)];
    stack.spacing = 10;
    UILabel *title = [UILabel new];
    title.text = @"ATVerStack";
    [[stack addArrangedSubview:title] setAt_height:30];
    UIView *view2 = [UIView new];
    view2.backgroundColor = RandomColor;
    [[stack addArrangedSubview:view2] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(40).multipliedBy(1);
    }];
    UIView *view3 = [UIView new];
    view3.backgroundColor = RandomColor;
    [[stack addArrangedSubview:view3] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(50).multipliedBy(1);
    }];
    UILabel *label1 = [UILabel new];
    label1.text = @"label1 ";
    label1.textColor = RandomColor;
    label1.backgroundColor = RandomColor;
    label1.at_width = 100;
    //不设置高度,isFill = false。自适应大小
    [stack addArrangedSubview:label1];
    UILabel *label2 = [UILabel new];
    label2.text = @"label2";
    label2.textColor = RandomColor;
    label2.backgroundColor = RandomColor;
    label2.textAlignment = NSTextAlignmentCenter;
    self.label2 = label2;
    //label2 不设置高度,isFill = true， 宽度拉伸填满"
    [[stack addArrangedSubview:label2] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.multipliedBy(1);
    }];
    UILabel *label3 = [UILabel new];
    label3.text = @"label3";
    label3.textColor = RandomColor;
    label3.backgroundColor = RandomColor;
    [[stack addArrangedSubview:label3] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(50).multipliedBy(1);
    }];
    UILabel *title2 = [UILabel new];
    title2.text = @"ATHorView";
    [stack addArrangedSubview:title2];
    [title2 setAt_height:30];
    
    [[stack addArrangedSubview:[self getRowView]] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(80).multipliedBy(1);
    }];
    [[stack addArrangedSubview:[self getEqualVerView]] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(120).multipliedBy(1);
    }];
    [[stack addArrangedSubviewTail:[self getControlsView2]] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(30).multipliedBy(1);
    }];
    [[stack addArrangedSubviewTail:[self getControlsView]] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(150).multipliedBy(1);
    }];
    self.verStack = stack;
}

-(UIView*)getRowView{
    UIView *rowView = [UIView new];
    ATHorStack *stack = [rowView getStackHor];
    stack.spacing = 10;
    UIView *view1 = [UIView new];
    view1.backgroundColor = RandomColor;
    [stack addArrangedSubviewTail:view1];
    [view1 at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.width(50).multipliedBy(1);
    }];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = RandomColor;
    [[stack addArrangedSubviewTail:view2] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.width(60).multipliedBy(1);
    }];
    UIView *view3 = [UIView new];
    view3.backgroundColor = RandomColor;
    [[stack addArrangedSubviewTail:view3] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.width(50).multipliedBy(1);
    }];
    UILabel *label1 = [UILabel new];
    label1.text = @"label4";
    label1.textColor = RandomColor;
    label1.backgroundColor = RandomColor;
    //不设置高度,isFill = false。自适应大小
    [stack addArrangedSubview:label1];
    self.label4 = label1;
    UILabel *label2 = [UILabel new];
    label2.text = @"label5";
    label2.textColor = RandomColor;
    label2.backgroundColor = RandomColor;
    label2.textAlignment = NSTextAlignmentCenter;
    //label2 不设置高度,isFill = true， 宽度拉伸填满"
    [stack addArrangedSubview:label2];
    UILabel *label3 = [UILabel new];
    label3.text = @"label6";
    label3.textColor = RandomColor;
    label3.backgroundColor = RandomColor;
    //label3 设置高度，isFill = false，高度自定义，宽度自适应"
    [[stack addArrangedSubviewTail:label3] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.width(50).multipliedBy(1);
    }];
    self.horStack = stack;
    return rowView;
}

-(UIView*)getControlsView{
    UIView *view = [UIView new];
    ATHorStack *stack = [view getStackHorWithInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    stack.spacing = 3.0;
    UIButton *button1 = [UIButton new];
    [button1 setTitle:@"Leading" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [[stack addArrangedSubview:button1] setAt_flex:1];
    button1.tag = ATStackAlignmentLeading;
    UIButton *button2 = [UIButton new];
    [button2 setTitle:@"Center" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor] ;
    [button2 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [[stack addArrangedSubview:button2] setAt_flex:1];
    button2.tag = ATStackAlignmentCenter;
    UIButton *button3 = [UIButton new];
    [button3 setTitle:@"Trailing" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor blueColor] ;
    [button3 addTarget:self action:@selector(selectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [[stack addArrangedSubview:button3] setAt_flex:1];
    button3.tag = ATStackAlignmentTrailing;
    return view;
}

-(UIView*)getControlsView2{
    UIView *view = [UIView new];
    ATHorStack *stack = [view getStackHorWithInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    stack.spacing = 3.0;
    UIButton *button1 = [UIButton new];
    [button1 setTitle:@"show" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    [[stack addArrangedSubview:button1] setAt_flex:1];
    button1.tag = ATStackAlignmentTrailing;
    UIButton *button2 = [UIButton new];
    [button2 setTitle:@"hidden" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor blueColor] ;
    [button2 addTarget:self action:@selector(hidden:) forControlEvents:UIControlEventTouchUpInside];
    [[stack addArrangedSubview:button2] setAt_flex:1];
    button2.tag = ATStackAlignmentCenter;
    return view;
}

-(UIView*)getEqualVerView{
    UIView *view = [UIView new];
    ATVerStack *stack = [view getStackVerWithInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    stack.spacing = 10;
    UIView *view1 = [UIView new];
    view1.backgroundColor = RandomColor;
    [[stack addArrangedSubview:view1] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(50).multipliedBy(1).space(30);
    }];
    UIView *view2 = [UIView new];
    view2.backgroundColor = RandomColor;
    self.view2 = view2;
    [[stack addArrangedSubview:view2] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(60).multipliedBy(1);
    }];
    UIView *view3 = [UIView new];
    view3.backgroundColor = RandomColor;
    [[stack addArrangedSubview:view3] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
        make.height(50).multipliedBy(1);
    }];
    return view;
}

-(void)show:(UIButton*)button{
    self.view2.at_hidden = false;
    self.label2.at_hidden = false;
    self.label4.at_hidden = false;
    [UIView animateWithDuration:0.5 animations:^{
        [self.verStack layoutFrame];
    }];
}

-(void)hidden:(UIButton*)button{
    self.view2.at_hidden = true;
    self.label2.at_hidden = true;
    self.label4.at_hidden = true;
    [UIView animateWithDuration:0.5 animations:^{
        [self.verStack layoutFrame];
    }];

}

-(void)selectedAction:(UIButton*)button{
    self.verStack.alignment = button.tag;
    self.horStack.alignment = button.tag;
    [UIView animateWithDuration:0.5 animations:^{
        [self.verStack layoutFrame];
    }];
}

@end

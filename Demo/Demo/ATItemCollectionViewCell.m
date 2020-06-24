//
//  ATItemCollectionViewCell.m
//  Demo
//
//  Created by jiang aoteng on 2020/5/19.
//  Copyright © 2020 jiang aoteng. All rights reserved.
//

#import "ATItemCollectionViewCell.h"
#import "UIView+ATStack.h"
@interface ATItemCollectionViewCell()

@property(nonatomic, strong)UILabel *label1;
@property(nonatomic, strong)UILabel *label2;
@property(nonatomic, strong)UILabel *label3;
@property(nonatomic, strong)UILabel *label4;
@property(nonatomic, strong)UILabel *label5;
@property(nonatomic, strong)UILabel *label6;
@property(nonatomic, strong)ATVerStack *vStack;
@property(nonatomic, strong)ATHorStack *horStack1;
@property(nonatomic, strong)ATHorStack *horStack2;
@end

@implementation ATItemCollectionViewCell

// 在init方法中添加子控件
-(id)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        self.backgroundColor = [UIColor greenColor];
        self.vStack = [self.contentView getStackVer];
        {
            UIView *view = [UIView new];
            ATHorStack *stack = [view getStackHor];
            stack.spacing = 4;
            stack.alignment = ATStackAlignmentCenter;
            self.label1 = [UILabel new];
            self.label1.textColor = [UIColor blackColor];
            [stack addArrangedSubview:self.label1];
            
            self.label2 = [UILabel new];
            self.label2.textColor = [UIColor blackColor];
            [stack addArrangedSubview:self.label2];
            
            self.label3 = [UILabel new];
            self.label3.textColor = [UIColor blackColor];
            [stack addArrangedSubview:self.label3];
            [[self.vStack addArrangedSubview:view] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
                make.height(20).multipliedBy(1);
            }];
            self.horStack1 = stack;
        }
        {
            UIView *view = [UIView new];
            ATHorStack *stack = [view getStackHor];
            stack.spacing = 4;
            stack.alignment = ATStackAlignmentCenter;
            self.label4 = [UILabel new];
            self.label4.textColor = [UIColor blackColor];
            [stack addArrangedSubview:self.label4];
            
            self.label5 = [UILabel new];
            self.label5.textColor = [UIColor blackColor];
            [stack addArrangedSubview:self.label5];
            
            self.label6 = [UILabel new];
            self.label6.textColor = [UIColor blackColor];
            [stack addArrangedSubview:self.label6];
            [[self.vStack addArrangedSubview:view] at_makeFlexBox:^(ATStackFlexBoxMaker * _Nonnull make) {
                make.height(20).multipliedBy(1);
            }];
            self.horStack2 = stack;
        }
    }
    return self;
}

-(NSString*)randNumer{
    int random = rand() % 100;
    return [NSString stringWithFormat:@"%d", random];
}

-(void)loadData{
    self.vStack.alignment = rand()%2;
    self.vStack.spacing = rand()%2;
    self.horStack1.alignment = rand()%2;
    self.horStack1.spacing = rand()%3;
    self.horStack2.alignment = rand()%2;
    self.horStack2.spacing = rand()%3;
    self.label1.text = [self randNumer];
    self.label1.at_height = 15 + rand()%3;
    self.label2.text = [self randNumer];
    self.label2.at_height = 15 + rand()%3;
    self.label3.text = [self randNumer];
    self.label3.at_height = 15 + rand()%3;
    self.label4.text = [self randNumer];
    self.label4.at_height = 15 + rand()%3;
    self.label5.text = [self randNumer];
    self.label5.at_height = 15 + rand()%3;
    self.label6.text = [self randNumer];
    self.label6.at_height = 15 + rand()%3;
    [self.vStack layoutFrame];
}
@end

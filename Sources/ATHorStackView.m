//
//  ATHorStackView.m
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/10.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import "ATHorStackView.h"

@interface ATHorStackView()

@end;

//水平轴线
@implementation ATHorStackView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.axis = UILayoutConstraintAxisHorizontal;
        self.alignment = UIStackViewAlignmentCenter;
        self.distribution = UIStackViewDistributionFill;
        self.tailArray = [[NSMutableArray alloc] init];
    }
    return self;
}

+(ATHorStackView *)getStackHor{
    ATHorStackView *stack = [ATHorStackView new];
    return stack;
}

+(ATHorStackView*)getStackHorEqueal{
    ATHorStackView *stack = [ATHorStackView getStackHor];
    stack.distribution = UIStackViewDistributionFillEqually;
    stack.alignment = UIStackViewAlignmentFill;
    return stack;
}

+(ATHorStackView *)getStackHorCenter{
    ATHorStackView *stack =  [ATHorStackView getStackHor];
    stack.alignment = UIStackViewAlignmentCenter;
    stack.distribution = UIStackViewDistributionFill;
    return stack;
}

-(ATHorStackView*)addArrangedStackH{
    ATHorStackView *stack =  [ATHorStackView getStackHor];
    [self addArrangedSubview:stack];
    return stack;
}

-(void)setView:(UIView*)view width:(CGFloat)width{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:width];
    [view addConstraint:widthConstraint];
}

-(void)setView:(UIView*)view isFill:(Boolean)isFill{
    if (isFill) {
        NSLayoutConstraint *heighConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeHeight
                                                                          multiplier:1.0
                                                                            constant:0];
        [self addConstraint:heighConstraint];
    }
}

-(void)addArrangedSubview: (UIView*)view width:(CGFloat)width{
    [self addArrangedSubview:view];
    [self setView:view width:width];
}


-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(Boolean)isFill{
    [self addArrangedSubview:view isFill:isFill];
    [self setView:view width:width];
}

-(void)addArrangedSubview:(UIView*)view isFill:(Boolean)isFill{
    [self addArrangedSubview:view];
    [self setView:view isFill:isFill];
}

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill position:(ATStackViewPosition)position{
    [self addArrangedSubview:view position:position];
    [self setView:view width:width];
    [self setView:view isFill:isFill];
}

-(void)addSpacing:(CGFloat)spacing{
    [self addSpacing:spacing postion:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion{
    UIStackView *stack = [UIStackView new];
    [self addArrangedSubview:stack position:postion];
    [self setView:stack width:spacing - self.spacing*2];
}

@end

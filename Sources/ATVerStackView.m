//
//  ATVerStackView.m
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/10.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import "ATVerStackView.h"

//竖直轴线
@implementation ATVerStackView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.axis = UILayoutConstraintAxisVertical;
        self.alignment = UIStackViewAlignmentLeading;
        self.distribution = UIStackViewDistributionFill;
    }
    return self;
}

+(ATVerStackView *)getStackVer{
    ATVerStackView *stack = [ATVerStackView new];
    return stack;
}

+(ATVerStackView *)getStackVerCenter{
    ATVerStackView *stack = [ATVerStackView getStackVer];
    stack.alignment = UIStackViewAlignmentCenter;
    stack.distribution = UIStackViewDistributionFill;
    return stack;
}

+(ATVerStackView*)getStackVerEqueal{
    ATVerStackView *stack = [ATVerStackView getStackVer];
    stack.distribution = UIStackViewDistributionFillEqually;
    return stack;
}

-(ATVerStackView *)addArrangedStackV{
    ATVerStackView *stack = [ATVerStackView getStackVer];
    [self addArrangedSubview:stack];
    return stack;
}

-(void)setView:(UIView*)view height:(CGFloat)height{
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:height];
    [view addConstraint:heightConstraint];
}

-(void)setView:(UIView*)view isFill:(Boolean)isFill{
    if (isFill) {
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self
                                                                           attribute:NSLayoutAttributeWidth
                                                                          multiplier:1.0
                                                                            constant:0];
        [self addConstraint:widthConstraint];
    }
}

-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height{
    [self addArrangedSubview:view];
    [self setView:view height:height];
}

-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height isFill:(Boolean)isFill{
    [self addArrangedSubview:view isFill:isFill];
    [self setView:view height:height];
}

-(void)addArrangedSubview:(UIView*)view isFill:(Boolean)isFill{
    [self addArrangedSubview:view];
    [self setView:view isFill:isFill];
}

-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position{
    [self addArrangedSubview:view position:position];
    [self setView:view height:height];
    [self setView:view isFill:isFill];
}

-(void)addSpacing:(CGFloat)spacing{
    [self addSpacing:spacing postion:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion{
    UIStackView *stack = [UIStackView new];
    [self addArrangedSubview:stack position:postion];
    [self setView:stack height:spacing - self.spacing*2];
}

@end

//
//  ATStack.h
//  Demo
//
//  Created by jiang aoteng on 2019/11/4.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef enum ATStackViewPosition: NSUInteger {
/**从头部添加元素*/
    ATStackViewPositionHead = 0,
/**从尾部添加元素*/
    ATStackViewPositionTail = 1,
} ATStackViewPosition;

@interface ATStack: NSObject

@property(nonatomic, weak) UIView *view;

@property(nonatomic, readwrite, strong) NSMutableArray *arrangedSubviews;

@property(nonatomic, assign) UILayoutConstraintAxis axis;

@property(nonatomic, readwrite, assign) UIStackViewDistribution distribution;

@property(nonatomic, readwrite, assign) UIStackViewAlignment alignment;

@property(nonatomic, readwrite, assign) CGFloat spacing;

@property(nonatomic, strong) NSMutableArray<UIView*> *tailArray;

-(void)addArrangedSubview:(UIView*)view;

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position;

- (instancetype)initWithView:(UIView*)view;

-(void)addSpacing:(CGFloat)spacing;

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion;

-(void)layoutFrame;

@end

NS_ASSUME_NONNULL_END

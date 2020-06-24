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


typedef enum ATStackConstraintAxis : NSInteger {
    ATStackConstraintAxisHorizontal = 0,
    ATStackConstraintAxisVertical
} ATStackConstraintAxis;

typedef enum ATStackAlignment : NSInteger {
//    ATStackAlignmentFill = 0,
    ATStackAlignmentLeading,
//    ATStackAlignmentTop,
//    ATStackAlignmentFirstBaseline,
    ATStackAlignmentCenter,
    ATStackAlignmentTrailing,
    ATStackAlignmentAuto,
//    ATStackAlignmentBottom,
//    ATStackAlignmentLastBaseline,
} ATStackAlignment;


typedef enum ATStackViewPosition: NSUInteger {
/**从头部添加元素*/
    ATStackViewPositionHead = 0,
/**从中间添加元素*/
    ATStackViewPositionCenter,
/**从尾部添加元素*/
    ATStackViewPositionTail,
    
} ATStackViewPosition;

@interface ATStack: NSObject{
    @protected
    NSMutableArray *arrangedSubviewsHead;
    @protected
    NSMutableArray *arrangedSubviewsCenter;
    @protected
    NSMutableArray *arrangedSubviewsTail;
    @protected
    UIEdgeInsets inset;
}

@property(nonatomic, weak) UIView *view;

@property(nonatomic, readonly, assign) ATStackConstraintAxis axis;

@property(nonatomic, readwrite, assign) ATStackAlignment alignment;

@property(nonatomic, readwrite, assign) CGFloat spacing;

@property(nonatomic, readonly, assign) CGRect frame;

-(UIView*)addArrangedSubview:(UIView*)view;

-(UIView*)addArrangedSubviewCenter:(UIView*)view;

-(UIView*)addArrangedSubviewTail:(UIView*)view;

-(UIView*)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position;

-(void)addSpacing:(CGFloat)spacing;

-(void)addSpacing:(CGFloat)spacing position:(ATStackViewPosition)position;

-(void)layoutFrame;

-(void)removeArrangedSubview:(UIView*)view;

-(void)removeLastObjectWithPositon:(ATStackViewPosition)position;

-(void)removeFisrstObjectWithPositon:(ATStackViewPosition)position;

-(void)removeobjectAtIndex:(NSUInteger)index positon:(ATStackViewPosition)position;

-(void)removeAll;

-(void)removeAllWithPositon:(ATStackViewPosition)position;


@end

NS_ASSUME_NONNULL_END

//
//  ATStackView.h
//  EBookingiPhone
//
//  Created by jiang aoteng on 2018/8/15.
//  Copyright © 2018年 ctrip.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
/**从头部添加元素*/
    ATStackViewPositionHead = 0,
/**从尾部添加元素*/
    ATStackViewPositionTail = 1,
} ATStackViewPosition;

@interface ATStackView : UIStackView

@property(nonatomic, strong) NSMutableArray<UIView*> *tailArray;

-(void)addArrangedSubview:(UIView*)view position:(ATStackViewPosition)position;

@end

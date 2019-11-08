//
//  ATVerStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/6.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATVerStack.h"
#import "UIView+ATStack2.h"
@implementation ATVerStack

- (instancetype)initWithView:(UIView *)view{
    self = [super initWithView:view];
    if(self){
        self.axis = UILayoutConstraintAxisVertical;
        self.alignment = UIStackViewAlignmentCenter;
        self.distribution = UIStackViewDistributionFill;
    }
    return self;
}

-(void)addArrangedSubview:(UIView *)view{
    [self addArrangedSubview:view height:0 isFill:false position:ATStackViewPositionHead];
}

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height{
    [self addArrangedSubview:view height:height isFill:false position:ATStackViewPositionHead];
}

-(void)addArrangedSubview: (UIView*)view height:(CGFloat)height isFill:(BOOL)isFill{
    [self addArrangedSubview:view height:height isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview: (UIView*)view isFill:(Boolean)isFill{
    [self addArrangedSubview:view height:0 isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView *)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position{
    [self.arrangedSubviews addObject:view];
    view.info.height = height;
    view.info.isFill = isFill;
}

-(void)addSpacing:(CGFloat)spacing{
    [self addSpacing:spacing postion:ATStackViewPositionHead];
}

-(void)addSpacing:(CGFloat)spacing postion:(ATStackViewPosition)postion{
    if(postion == ATStackViewPositionHead){
        UIView *v = [self.arrangedSubviews lastObject];
        if(v){
            v.info.space = spacing;
        }
    }
}

-(void)layoutFrame{
    CGFloat width = self.view.frame.size.width;
    CGFloat y = 0;
    for (int i = 0; i < self.arrangedSubviews.count; i++) {
        UIView *v = self.arrangedSubviews[i];
        [v sizeToFit];
        CGFloat w = v.frame.size.width;
        CGFloat x = 0;
        CGFloat h = v.info.height > 0 ? v.info.height: v.frame.size.height;
        if(v.info.isFill){
            x = 0;
            w = width;
        }else{
            if (self.alignment == UIStackViewAlignmentLeading) {
                x = 0;
            }else if(self.alignment == UIStackViewAlignmentCenter){
                x = (width - w) / 2.0;
            }else if (self.alignment == UIStackViewAlignmentTrailing){
                x = width - w;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        y += self.spacing + h + v.info.space;
    }
}
@end

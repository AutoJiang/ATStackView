//
//  ATHorStack.m
//  Demo
//
//  Created by jiang aoteng on 2019/11/5.
//  Copyright © 2019 jiang aoteng. All rights reserved.
//

#import "ATHorStack.h"
#import "UIView+ATStack2.h"

@implementation ATHorStack

- (instancetype)initWithView:(UIView *)view{
    self = [super initWithView:view];
    if(self){
        self.axis = UILayoutConstraintAxisHorizontal;
        self.alignment = UIStackViewAlignmentLeading;
        self.distribution = UIStackViewDistributionFill;
    }
    return self;
}

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width{
    [self addArrangedSubview:view width:width isFill:false position:ATStackViewPositionHead];
}


-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill{
    [self addArrangedSubview:view width:width isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView*)view isFill:(BOOL)isFill{
    [self addArrangedSubview:view width:0 isFill:isFill position:ATStackViewPositionHead];
}

-(void)addArrangedSubview:(UIView*)view width:(CGFloat)width isFill:(BOOL)isFill position:(ATStackViewPosition)position{
    [self.arrangedSubviews addObject:view];
    view.info.width = width;
    view.info.isFill = isFill;
}

-(void)layoutFrame{
    if(self.arrangedSubviews.count <= 0){
        return;
    }
    if (self.distribution == UIStackViewDistributionFill) {
        [self layoutDistributionFrame];
    }else if (self.distribution == UIStackViewDistributionFillEqually){
        [self layoutEqualFrame];
    }
}

-(void)layoutDistributionFrame{
    CGFloat height = self.view.frame.size.height;
    CGFloat x = 0;
    for (int i = 0; i < self.arrangedSubviews.count; i++) {
        UIView *v = self.arrangedSubviews[i];
        [v sizeToFit];
        CGFloat h = v.frame.size.height;
        CGFloat y = 0;
        CGFloat w = v.info.width > 0 ? v.info.width: v.frame.size.width;
        if(v.info.isFill){
            y = 0;
            h = height;
        }else{
            if (self.alignment == UIStackViewAlignmentLeading) {
                y = 0;
            }else if(self.alignment == UIStackViewAlignmentCenter){
                y = (height - h) / 2.0;
            }else if (self.alignment == UIStackViewAlignmentTrailing){
                y = height - h;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        x += self.spacing + w + v.info.space;
        [v.stack layoutFrame];
    }
}

-(void)layoutEqualFrame{
    long count = self.arrangedSubviews.count;
    CGFloat height = self.view.frame.size.height;
    CGFloat x = 0;
    CGFloat spaceSum = (count - 1)*self.spacing;
    CGFloat w =  (self.view.frame.size.width - spaceSum)/count;
    
    for (int i = 0; i < self.arrangedSubviews.count; i++) {
        UIView *v = self.arrangedSubviews[i];
        [v sizeToFit];
        CGFloat h = v.frame.size.height;
        CGFloat y = 0;
        if(v.info.isFill){
            y = 0;
            h = height;
        }else{
            if (self.alignment == UIStackViewAlignmentLeading) {
                y = 0;
            }else if(self.alignment == UIStackViewAlignmentCenter){
                y = (height - h) / 2.0;
            }else if (self.alignment == UIStackViewAlignmentTrailing){
                y = height - h;
            }
        }
        v.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:v];
        x += self.spacing + w;
        [v.stack layoutFrame];
    }
}

@end

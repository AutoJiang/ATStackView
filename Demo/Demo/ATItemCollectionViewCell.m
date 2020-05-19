//
//  ATItemCollectionViewCell.m
//  Demo
//
//  Created by jiang aoteng on 2020/5/19.
//  Copyright © 2020 jiang aoteng. All rights reserved.
//

#import "ATItemCollectionViewCell.h"

@interface ATItemCollectionViewCell()

@end

@implementation ATItemCollectionViewCell

// 在init方法中添加子控件
-(id)initWithFrame:(CGRect)frame{

    if([super initWithFrame:frame]){
        UILabel *label = [UILabel new];
        label.text = @"123";
        label.backgroundColor = [UIColor redColor];
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:label];
        
    }
    return self;
}

// 重写属性的set方法，给子控件设置数据
//-(void)setShopItem:(PDshopItem *)shopItem{
//
// }

@end

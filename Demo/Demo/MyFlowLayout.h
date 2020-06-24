//
//  MyFlowLayout.h
//  Demo
//
//  Created by auto.jiang on 2020/6/24.
//  Copyright © 2020 jiang aoteng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 自定义瀑布流布局
 */
@interface MyFlowLayout : UICollectionViewFlowLayout

/**
 瀑布流布局方法
 
 @param itemWidth item 的宽度
 @param itemHeightArray item 的高度数组
 */
- (void)flowLayoutWithItemWidth:(CGFloat)itemWidth itemHeightArray:(NSArray<NSNumber *> *)itemHeightArray;

@end

NS_ASSUME_NONNULL_END

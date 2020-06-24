//
//  MyFlowLayout.m
//  Demo
//
//  Created by auto.jiang on 2020/6/24.
//  Copyright © 2020 jiang aoteng. All rights reserved.
//

#import "MyFlowLayout.h"



@interface MyFlowLayout ()

/**
 item 的高度数组
 */
@property (nonatomic, copy) NSArray<NSNumber *> *arrItemHeight;

/**
 cell 布局属性集
 */
@property (nonatomic, strong) NSArray<UICollectionViewLayoutAttributes *> *arrAttributes;

@end

@implementation MyFlowLayout

/**
 瀑布流布局方法
 
 @param itemWidth item 的宽度
 @param itemHeightArray item 的高度数组
 */
- (void)flowLayoutWithItemWidth:(CGFloat)itemWidth itemHeightArray:(NSArray<NSNumber *> *)itemHeightArray {
    
    self.itemSize = CGSizeMake(itemWidth, 0);
    self.arrItemHeight = itemHeightArray;
    [self.collectionView reloadData];
}

- (void)prepareLayout {
    
    [super prepareLayout];
    
    // item 数量为零不做处理
    if ([self.arrItemHeight count] == 0) {
        
        return;
    }
    
    // 计算一行可以放多少个项
    NSInteger nItemInRow = (self.collectionViewContentSize.width - self.sectionInset.left - self.sectionInset.right + self.minimumInteritemSpacing) / (self.itemSize.width + self.minimumInteritemSpacing);
    // 对列的长度进行累计
    NSMutableArray *arrmColumnLength = [NSMutableArray arrayWithCapacity:100];
    for (NSInteger i = 0; i < nItemInRow; i++) {
        
        [arrmColumnLength addObject:@0];
    }
    
    NSMutableArray *arrmTemp = [NSMutableArray arrayWithCapacity:100];
    // 遍历设置每一个item的布局
    for (NSInteger i = 0; i < [self.arrItemHeight count]; i++) {
        
        // 设置每个item的位置等相关属性
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        // 创建每一个布局属性类，通过indexPath来创建
        UICollectionViewLayoutAttributes *attris = [self layoutAttributesForItemAtIndexPath:index];
        CGRect recFrame = attris.frame;
        // 有数组得到的高度
        recFrame.size.height = [self.arrItemHeight[i] doubleValue];
        // 最短列序号
        NSInteger nNumShort = 0;
        // 最短的长度
        CGFloat fShortLength = [arrmColumnLength[0] doubleValue];
        // 比较是否存在更短的列
        for (int i = 1; i < [arrmColumnLength count]; i++) {

            CGFloat fLength = [arrmColumnLength[i] doubleValue];
            if (fLength < fShortLength) {

                nNumShort = i;
                fShortLength = fLength;
            }
        }
        // 插入到最短的列中
        recFrame.origin.x = self.sectionInset.left + (self.itemSize.width + self.minimumInteritemSpacing) * nNumShort;
        recFrame.origin.y = fShortLength + self.minimumLineSpacing;
        // 更新列的累计长度
        arrmColumnLength[nNumShort] = [NSNumber numberWithDouble:CGRectGetMaxY(recFrame)];
        
        // 更新布局
        attris.frame = recFrame;
        [arrmTemp addObject:attris];
    }
    self.arrAttributes = arrmTemp;
    
    // 因为使用了瀑布流布局使得滚动范围是根据 item 的大小和个数决定的，所以以最长的列为基准，将高度平均到每一个 cell 中
    // 最长列序号
    NSInteger nNumLong = 0;
    // 最长的长度
    CGFloat fLongLength = [arrmColumnLength[0] doubleValue];
    // 比较是否存在更短的列
    for (int i = 1; i < [arrmColumnLength count]; i++) {

        CGFloat fLength = [arrmColumnLength[i] doubleValue];
        if (fLength > fLongLength) {

            nNumLong = i;
            fLongLength = fLength;
        }
    }
    // 在大小一样的情况下，有多少行
    NSInteger nRows = ([self.arrItemHeight count] + nItemInRow - 1) / nItemInRow;
    self.itemSize = CGSizeMake(self.itemSize.width, (fLongLength + self.minimumLineSpacing) / nRows - self.minimumLineSpacing);
    
}

// 返回所有的 cell 布局数组
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.arrAttributes;
}
@end

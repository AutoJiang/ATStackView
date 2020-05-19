//
//  SecondExampleViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#define kScreenWidth UIScreen.mainScreen.bounds.size.width

#import "SecondExampleViewController.h"
#import "UIView+ATStack.h"
#import "ATItemCollectionViewCell.h"
@interface SecondExampleViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, copy) NSArray *datas;
@end

@implementation SecondExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置item的行间距和列间距
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    // 设置item的大小
    CGFloat itemW = kScreenWidth / 2.5 ;
    layout.itemSize = CGSizeMake(itemW, itemW);
    // 设置每个分区的 上左下右 的内边距
    layout.sectionInset = UIEdgeInsetsMake(5, 5 ,5, 5);
    // 设置区头和区尾的大小
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 65);
    layout.footerReferenceSize = CGSizeMake(kScreenWidth, 65);
    // 设置分区的头视图和尾视图 是否始终固定在屏幕上边和下边
    layout.sectionFootersPinToVisibleBounds = YES;

    // 设置滚动条方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc] initWithFrame: UIScreen.mainScreen.bounds collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    self.collectionView.scrollEnabled = YES;  //滚动使能
    [self.collectionView registerClass:[ATItemCollectionViewCell class] forCellWithReuseIdentifier:@"ATStackViewCollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.datas = @[@1,@2,@3,@1,@1,@1,@1];
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 6;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.datas.count;  //每个section的Item数
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建item 从缓存池中拿 Item
    ATItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ATStackViewCollectionCell" forIndexPath:indexPath];
    // 外界在此给Item添加模型数据
    if(self.datas.count > 0){
//        PDshopItem *item = self.normalGoodLists[indexPath.item];
//        cell.cheapShopItem = item;
    }
    return cell;
    
}
@end

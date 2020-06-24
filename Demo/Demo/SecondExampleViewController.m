//
//  SecondExampleViewController.m
//  Demo
//
//  Created by jiang aoteng on 2018/9/29.
//  Copyright © 2018年 jiang aoteng. All rights reserved.
//

#define kScreenWidth UIScreen.mainScreen.bounds.size.width
#define kScreenHeight UIScreen.mainScreen.bounds.size.height

#import "SecondExampleViewController.h"
#import "UIView+ATStack.h"
#import "ATItemCollectionViewCell.h"
#import "MyFlowLayout.h"
@interface SecondExampleViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, copy) NSArray *datas;
@property(nonatomic, strong) NSTimer *timer;
@end

@implementation SecondExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyFlowLayout *layout = [[MyFlowLayout alloc] init];
    // 创建随机高度的数组
    NSMutableArray *arrmHeight = [NSMutableArray arrayWithCapacity:100];
    for (NSInteger i = 0; i < 10000; i++) {
        
        // 40～80 的随机高度
        [arrmHeight addObject:[NSNumber numberWithDouble:40 + arc4random() % 20]];
    }
    [layout flowLayoutWithItemWidth:80 itemHeightArray:arrmHeight];
    // 以最小间距为10计算间距
    // 每行可放多少 cell
    NSInteger nCountCell = (kScreenWidth - 10) / (layout.itemSize.width + 10);
    // 平均后的间距
    CGFloat fSpacing = (kScreenWidth - layout.itemSize.width * nCountCell) / (nCountCell + 1);
    layout.minimumInteritemSpacing = fSpacing;
    layout.minimumLineSpacing = fSpacing;
    layout.sectionInset = UIEdgeInsetsMake(fSpacing, fSpacing, fSpacing, fSpacing);

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
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i < 10000; i++) {
        [array addObject:@1];
    }
    self.datas = array.copy;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:true block:^(NSTimer * _Nonnull timer) {
//        CGPoint point = self.collectionView.contentOffset;
//        point.y += kScreenHeight;
//        [self.collectionView setContentOffset:point animated:true];
//    }];
   
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;   //返回section数
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
        [cell loadData];
    }
    return cell;
    
}
@end

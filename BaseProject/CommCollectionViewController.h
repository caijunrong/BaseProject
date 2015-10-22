//
//  CommCollectionViewController.h
//  BaseProject
//
//  Created by caijunrong on 15/05/22.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommTableViewController.h"
#import <MJRefresh.h>

@interface CommCollectionViewController : CommonViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    void (^getClickBlock)(int cellIndexID);
}
@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, assign) int page;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat horizontalSpace;

//增加刷新 & 加载功能
- (void)addCollectionViewRefreshFunction;

//网络访问
- (void)getData:(BOOL)isRefresh;

//collectionview 实际使用中腰重写该方法
-(void)initCollectionCell;

//collectionView block
-(void)setClickCellBlock:( void(^)(int cellIndexID) )clickBlock;

@end

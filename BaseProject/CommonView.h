//
//  CommonView.h
//  BaseProject
//
//  Created by caijunrong on 15/05/22.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface CommonView : UIView<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    void (^getClickBlock)(int cellIndexID);
    void (^getClickTableViewBlick)(NSIndexPath *cellIndexPath);
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, assign) int page;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat horizontalSpace;

//增加刷新功能
- (void)addRefreshFunction;

//网络访问
- (void)getData:(BOOL)isRefresh;

//初始化一个tableview
- (void)initTableView:(BOOL)isgroupTableView;

//tableView block
-(void)setClickTableViewBlick:( void(^)(NSIndexPath * cellIndexID) )clickBlock;

//collectionview 实际使用中腰重写该方法
-(void)initCollectionCell;

//collectionView block
-(void)setClickCellBlock:( void(^)(int cellIndexID) )clickBlock;

@end

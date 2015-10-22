//
//  CommonView.m
//  BaseProject
//
//  Created by caijunrong on 15/05/22.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommonView.h"

@implementation CommonView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}


- (void)initTableView:(BOOL)isgroupTableView{
    
    if (isgroupTableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }else{
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    _tableView.tableFooterView = view;
    
}

- (UITableView *)tableView{
    
    //如果没有初始化的话，默认plain样式
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = view;
    }
    
    return _tableView;
}

//增加刷新 & 加载功能
- (void)addRefreshFunction{
    
    __weak typeof(self) weakself = self;
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself getData:YES];
    }];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself getData:NO];
    }];
    
    [self.tableView.header beginRefreshing];
}

//网路请求
- (void)getData:(BOOL)isRefresh{
    
    
}

#pragma mark ---- tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"");
    
    if (getClickTableViewBlick) {
        getClickTableViewBlick(indexPath);
    }
    
}

- (void)setClickTableViewBlick:(void (^)(NSIndexPath *))clickBlock{
    getClickTableViewBlick = [clickBlock copy];
}

#pragma mark UICollectionView

//实际使用中重写这个方法，把collectionview变成自己想要的样式，这里只是做一个模版
-(void)initCollectionCell{
    
    _horizontalSpace = 13;
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    //修改
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = _horizontalSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    UICollectionView *myCollectionView;
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:flowLayout];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.showsHorizontalScrollIndicator = NO;
    myCollectionView.backgroundColor = [UIColor whiteColor];
    
    
    //修改
    //    [myCollectionView registerClass:[SpecialHorizontalCollectionViewCell class] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    
    //修改
//    [myCollectionView registerNib:[UINib nibWithNibName:@"SpecialHorizontalCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    
    [self addSubview:myCollectionView];
    self.collectionView = myCollectionView;
    
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0,0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (getClickBlock) {
        getClickBlock((int)indexPath.row);
    }
    
}

-(void)setClickCellBlock:(void (^)(int))clickBlock{
    getClickBlock = [clickBlock copy];
}

@end

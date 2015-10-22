//
//  CommCollectionViewController.m
//  BaseProject
//
//  Created by caijunrong on 15/05/22.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommCollectionViewController.h"

@interface CommCollectionViewController ()

@end

@implementation CommCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化page。自己决定
    self.page = 1;
    
    self.isRefresh = YES;

}

//增加刷新 & 加载功能
- (void)addCollectionViewRefreshFunction{
    
    __weak typeof(self) weakself = self;
    self.collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakself getData:YES];
    }];
    
    self.collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakself getData:NO];
    }];
    
    [self.collectionView.header beginRefreshing];
}

//网路请求
- (void)getData:(BOOL)isRefresh{
    
    
}


//实际使用中重写这个方法，把collectionview变成自己想要的样式，这里只是做一个模版
-(void)initCollectionCell{
    
    _horizontalSpace = 13;
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    //修改
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = _horizontalSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    UICollectionView *myCollectionView;
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.showsHorizontalScrollIndicator = NO;
    myCollectionView.backgroundColor = [UIColor whiteColor];
    
    
    //修改
    //    [myCollectionView registerClass:[SpecialHorizontalCollectionViewCell class] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    //或者
    //修改
    //    [myCollectionView registerNib:[UINib nibWithNibName:@"SpecialHorizontalCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    
//    [self.view addSubview:myCollectionView];
    self.collectionView = myCollectionView;
    
    
}


#pragma mark <UICollectionViewDataSource>

//重写--> header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize headsize;
    headsize = CGSizeMake(0, 0);
    return headsize;
}


//重写--> header+footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //头
        NSLog(@"--");
    }
    
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"collecionviewheadCell" forIndexPath:indexPath];
    
    return headView;
}


//cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(0,0);
}

//组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//列
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

//cell样式
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

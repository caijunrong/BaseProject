//
//  ViewControllerD.m
//  BaseProject
//
//  Created by caijunrong on 15/05/20.
//  Copyright © 2015年 caijunrong. All rights reserved.
//


#import "ViewControllerD.h"
#import "JCollectionViewCell.h"
#import "ViewControllerA.h"

@interface ViewControllerD ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewControllerD

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor darkGrayColor]];

    [self setNavTitle:@"第4个页面"];
    self.navigationItem.rightBarButtonItem = [self rightButtonItemWithTitle:nil orImageString:@"link_shuaxin"];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    
    [self initCollectionCell];
    
    
    //步骤3:设置要不要加入上下拉功能
    [self addCollectionViewRefreshFunction];
    
    [self.view addSubview:self.collectionView];
    
    NSLog(@"self.collectionView:%@",self.collectionView);
}

- (void)righBarClick{
    [super righBarClick];
    ViewControllerA *secondController = [[ViewControllerA alloc]init];
    secondController.isNeedBackItem = NO;
    [self.navigationController pushViewController:secondController animated:YES];
    
}


//实际使用中重写这个方法，把collectionview变成自己想要的样式，这里只是做一个模版
-(void)initCollectionCell{
    
    self.horizontalSpace = 13;
    
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    //修改
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = self.horizontalSpace;
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    UICollectionView *myCollectionView;
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.showsVerticalScrollIndicator = YES;
    
    myCollectionView.backgroundColor = [UIColor whiteColor];
    
    
    //修改
    //    [myCollectionView registerClass:[SpecialHorizontalCollectionViewCell class] forCellWithReuseIdentifier:@"SpecialHorizontalCollectionViewCell"];
    //或者
    //修改
        [myCollectionView registerNib:[UINib nibWithNibName:@"JCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    //    [self.view addSubview:myCollectionView];
    self.collectionView = myCollectionView;
    
    
}


//重写getdata方法
-(void)getData:(BOOL)isRefresh{
    
    [super getData:isRefresh];
    
    if (isRefresh) {
        self.page = 1;
    }
    
    NSMutableDictionary *paramter = [[NSMutableDictionary alloc]init];
    [paramter setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"pageIndex"];
    [paramter setObject:@"20" forKey:@"pageSize"];
    [paramter setObject:@"0" forKey:@"giftType"];
    [paramter setObject:@"" forKey:@"mallUrl"];
    [paramter setObject:@"" forKey:@"mallLetter"];
    [paramter setObject:@"0" forKey:@"mallNation"];
    
    
    [self.appDataHelper getPostListDataWithUrl:[self.apiUtil getUrlWithApi:@"GetGiftListQueryJson"] AndParameter:paramter AndIsRefrresh:isRefresh RefreshSuccess:^(NSArray *dateArray) {
        
        if (!self.dataArray) {
            self.dataArray = [[NSMutableArray alloc]init];
        }
        
        for (NSDictionary *dic in dateArray) {
            [self.dataArray addObject:dic];
        }
        
        self.page ++;
        
        [self.collectionView reloadData];
        
        NSLog(@"RefreshSuccess");
    } RefreshFailure:^{
        NSLog(@"RefreshFailure");
    } RefreshEmpty:^{
        NSLog(@"RefreshEmpty");
    } LoadMoreSuccess:^(NSArray *dataArray) {
        
        for (NSDictionary *dic in dataArray) {
            [self.dataArray addObject:dic];
        }
        self.page ++;
        
        [self.collectionView reloadData];
        NSLog(@"LoadMoreSuccess");
    } LoadMoreFailure:^{
        NSLog(@"LoadMoreFailure");
    } LoadMoreEmpty:^{
        NSLog(@"LoadMoreEmpty");
    } Complete:^{
        NSLog(@"Complete");
        [self.collectionView.header endRefreshing];
        [self.collectionView.footer endRefreshing];
    }];
    
}

//cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(70,70);
}

//组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//列
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

//cell样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor blackColor]];
    
    return cell;
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"==");
    
//    if (getClickBlock) {
//        getClickBlock((int)indexPath.row);
//    }
    
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

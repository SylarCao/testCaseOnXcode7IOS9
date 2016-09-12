//
//  CollectionViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/12.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "CollectionViewVCTL.h"
#import "CollectionView123Cell.h"
#import "CollectionHeaderView.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface CollectionViewVCTL ()
<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation CollectionViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // collection view
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 1;
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 30);
    layout.footerReferenceSize = CGSizeZero;
    layout.itemSize = CGSizeMake(100, 80);
    layout.sectionInset = UIEdgeInsetsMake(20, 10, 0, 0);
    _collectionView.collectionViewLayout = layout;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionView123Cell" bundle:nil] forCellWithReuseIdentifier:[CollectionView123Cell getCellId]];
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[CollectionHeaderView getCellId]];
    
}



#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger rt = section *5+3;
    return rt;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionView123Cell *rt = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionView123Cell getCellId] forIndexPath:indexPath];
    rt.content.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    return rt;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize rt = CGSizeMake(kScreenWidth, 15+5*section);
    return rt;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[CollectionHeaderView getCellId] forIndexPath:indexPath];
    header.header.text = [NSString stringWithFormat:@"header = %ld", indexPath.section];
    return header;
}


@end

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
#import "CollectionView1234Cell.h"
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
    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionView1234Cell" bundle:nil] forCellWithReuseIdentifier:[CollectionView1234Cell getCellId]];
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
    if (section == 1)
    {
        rt = 1;
    }
    return rt;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *rt = nil;
    if (indexPath.section == 1)
    {
        CollectionView1234Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionView1234Cell getCellId] forIndexPath:indexPath];
        rt = cell;
    }
    else
    {
        CollectionView123Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[CollectionView123Cell getCellId] forIndexPath:indexPath];
        cell.content.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
        rt = cell;
    }
    return rt;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        NSLog(@"end display CollectionView1234Cell");
    }
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

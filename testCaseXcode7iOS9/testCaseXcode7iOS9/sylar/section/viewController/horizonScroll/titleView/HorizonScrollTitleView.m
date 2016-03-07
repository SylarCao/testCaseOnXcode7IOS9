//
//  HorizonScrollTitleView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/3.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizonScrollTitleView.h"
#import "HorizonScrollTitleCollectionCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizonScrollTitleView()
<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger count;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizonScrollTitleView

- (id)initWithNib
{
    UINib *nib = [UINib nibWithNibName:@"HorizonScrollTitleView" bundle:nil];
    self = [[nib instantiateWithOwner:nil options:nil] lastObject];
    self.frame = CGRectMake(0, 0, _size.width, _size.height);
    return self;
}

- (void)awakeFromNib
{
    _count = 0;
    _size = CGSizeMake(200, 40);
    self.backgroundColor = [UIColor clearColor];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HorizonScrollTitleCollectionCell" bundle:nil] forCellWithReuseIdentifier:[HorizonScrollTitleCollectionCell getCellId]];
    [(UICollectionViewFlowLayout *)_collectionView.collectionViewLayout setItemSize:_size];
    _collectionView.scrollEnabled = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
}

- (void)setWithCount:(NSInteger)count
{
    _count = count;
    [_collectionView reloadData];
}

- (void)setScrollToPos:(CGFloat)posX
{
    _collectionView.contentOffset = CGPointMake(posX, 0);

    
}



#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HorizonScrollTitleCollectionCell *rt = [collectionView dequeueReusableCellWithReuseIdentifier:[HorizonScrollTitleCollectionCell getCellId] forIndexPath:indexPath];
    [rt setWithContent:[NSString stringWithFormat:@"title = %ld", indexPath.row]];
    
    return rt;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scroll to %.2f", scrollView.contentOffset.x);
    
    NSInteger n200 = (NSInteger)scrollView.contentOffset.x % (NSInteger)_size.width;
    NSInteger n100 = labs(n200-100);
    
    CGFloat aa = n100/(_size.width/2);
    aa = aa + 0.1;
    self.alpha = aa;
}


@end

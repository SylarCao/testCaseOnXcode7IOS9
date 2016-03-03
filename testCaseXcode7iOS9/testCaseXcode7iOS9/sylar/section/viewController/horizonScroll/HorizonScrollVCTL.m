//
//  HorizonScrollVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/3.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizonScrollVCTL.h"
#import "HorizonScrollTitleView.h"
#import "HorizontalScrollCollectionCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizonScrollVCTL ()
<UICollectionViewDataSource, UICollectionViewDelegate, HorizontalScrollCollectionCellDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *layout;


@property (nonatomic, strong) HorizonScrollTitleView *titleView;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizonScrollVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitialValue];
}

- (void)setInitialValue
{
    _layout.itemSize = self.view.frame.size;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HorizontalScrollCollectionCell" bundle:nil] forCellWithReuseIdentifier:[HorizontalScrollCollectionCell getCellId]];
    
    // title
    _titleView = [[HorizonScrollTitleView alloc] initWithNib];
    [_titleView setWithCount:30];
    
    self.navigationItem.titleView = _titleView;
    
    
    
    
}


#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell for row = %ld", indexPath.row);
    HorizontalScrollCollectionCell *rt = [collectionView dequeueReusableCellWithReuseIdentifier:[HorizontalScrollCollectionCell getCellId] forIndexPath:indexPath];
    rt.delegate = self;
    [rt setWithContent:[NSString stringWithFormat:@"i = %ld", indexPath.row]];
    
    
    return rt;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pos_x = scrollView.contentOffset.x/_collectionView.frame.size.width*_titleView.size.width;
    [_titleView setScrollToPos:pos_x];
}

#pragma mark - HorizontalScrollCollectionCellDelegate
- (void)HorizontalScrollCollectionCellDidTapButton
{
    NSLog(@"back");
    
    
    
}
@end

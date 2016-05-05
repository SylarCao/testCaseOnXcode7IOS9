//
//  DragCollectionView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/12.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DragCollectionView.h"
#import "DragCollectionCell.h"
#import "UICollectionView+Draggable.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
## Getting Started

- Include UICollectionView+Draggable catagory (and related files).
- Include QuartzCoreFramework.
- Set `draggable` to true on collection view.
- Set `collectionViewLayout` to a layout that implements the `UICollectionViewLayout_Warpable` protocol (will fallback if layout does not). For the default Flow layout (grid) use `DraggableCollectionViewFlowLayout` - you can set this in Interface Builder.
- Implement the `UICollectionViewDataSource_Draggable` extended protocol.
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DragCollectionView ()
<UICollectionViewDelegate, UICollectionViewDataSource_Draggable>


@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DragCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // collection view
    [_collectionView registerNib:[UINib nibWithNibName:@"DragCollectionCell" bundle:nil] forCellWithReuseIdentifier:[DragCollectionCell getCellId]];
    _collectionView.draggable = YES;
     
}



#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DragCollectionCell *rt = [collectionView dequeueReusableCellWithReuseIdentifier:[DragCollectionCell getCellId] forIndexPath:indexPath];
    [rt setWithContentIndex:indexPath.row];
    return rt;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"move %ld to %ld", fromIndexPath.row, toIndexPath.row);
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    // Prevent item from being moved to index 0
    //    if (toIndexPath.item == 0) {
    //        return NO;
    //    }
    return YES;
}





@end

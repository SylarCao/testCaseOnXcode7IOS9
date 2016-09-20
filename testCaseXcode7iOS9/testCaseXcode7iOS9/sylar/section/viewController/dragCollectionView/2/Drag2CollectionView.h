//
//  Drag2CollectionView.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/5/5.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import <UIKit/UIKit.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@class Drag2CollectionView;

@protocol DragCollectionViewdelegate <UICollectionViewDataSource>

@optional

- (void)collectionViewDidBeginDrag:(Drag2CollectionView *)collectionView;
- (void)collectionViewDidEndDrag:(Drag2CollectionView *)collectionView;

- (void)collectionView:(Drag2CollectionView *)collectionView didDragItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Drag2CollectionView : UICollectionView

@property (nonatomic, weak) id<DragCollectionViewdelegate> dragDelegate;


// test
- (void)test1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
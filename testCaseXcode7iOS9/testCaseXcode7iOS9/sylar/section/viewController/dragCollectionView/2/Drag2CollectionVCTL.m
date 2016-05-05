//
//  Drag2CollectionVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/5/5.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "Drag2CollectionVCTL.h"
#import "Drag2CollectionView.h"
#import "DragCollectionCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Drag2CollectionVCTL ()
<UICollectionViewDelegate, UICollectionViewDataSource, DragCollectionViewdelegate>

@property (nonatomic, strong) Drag2CollectionView *dragCollectionView;

@property (nonatomic, strong) NSMutableArray *data;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation Drag2CollectionVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _data = [[NSMutableArray alloc] init];
    for (int i=1; i<40; i++)
    {
        NSString *obj = [NSString stringWithFormat:@"%d", i];
        [_data addObject:obj];
    }
    
    [self setInitialValue];
    
}

- (void)setInitialValue
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(80, 60);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 20;
    
    
    _dragCollectionView = [[Drag2CollectionView alloc] initWithFrame:CGRectMake(10, 10, 320, 400) collectionViewLayout:layout];
    _dragCollectionView.delegate = self;
    _dragCollectionView.dataSource = self;
    _dragCollectionView.dragDelegate = self;
    
    [self.view addSubview:_dragCollectionView];
    _dragCollectionView.layer.borderColor = [UIColor redColor].CGColor;
    _dragCollectionView.layer.borderWidth = 1;
    
    [_dragCollectionView registerNib:[UINib nibWithNibName:@"DragCollectionCell" bundle:nil] forCellWithReuseIdentifier:[DragCollectionCell getCellId]];
    
}


#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger rt = _data.count;
    return rt;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DragCollectionCell *rt = [collectionView dequeueReusableCellWithReuseIdentifier:[DragCollectionCell getCellId] forIndexPath:indexPath];
    
    [rt setWithContentIndex:[[_data objectAtIndex:indexPath.row] integerValue]];
    
    
    return rt;
}

- (void)collectionViewDidBeginDrag:(Drag2CollectionView *)collectionView
{
    NSLog(@"begin drag");
}

- (void)collectionViewDidEndDrag:(Drag2CollectionView *)collectionView
{
    NSLog(@"end drag");
}

- (void)collectionView:(Drag2CollectionView *)collectionView didDragItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSInteger from_index = sourceIndexPath.row;
    NSInteger to_index = destinationIndexPath.row;
    NSLog(@"move %ld to %ld", from_index, to_index);
    
    id obj = [_data objectAtIndex:from_index];
    [_data removeObject:obj];
    [_data insertObject:obj atIndex:to_index];
    
    NSLog(@"data = %@", _data.description);
    
}





@end

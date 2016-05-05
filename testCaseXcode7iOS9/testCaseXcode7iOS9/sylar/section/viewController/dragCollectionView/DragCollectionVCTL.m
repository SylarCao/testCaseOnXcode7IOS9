//
//  DragCollectionVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/5/5.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DragCollectionVCTL.h"
#import "DragCollectionView.h"
#import "Drag2CollectionVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DragCollectionVCTL ()


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DragCollectionVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1:(id)sender
{
    DragCollectionView *vv = [[DragCollectionView alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vv animated:YES];
}

- (IBAction)btn2:(id)sender
{
    Drag2CollectionVCTL *dd = [[Drag2CollectionVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:dd animated:YES];
}

@end

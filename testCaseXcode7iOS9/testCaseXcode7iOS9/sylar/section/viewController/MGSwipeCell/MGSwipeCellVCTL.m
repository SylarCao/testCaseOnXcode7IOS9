//
//  MGSwipeCellVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MGSwipeCellVCTL.h"
#import "MyMGCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MGSwipeCellVCTL ()
<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, weak) IBOutlet UITableView *table;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MGSwipeCellVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_table registerClass:[MyMGCell class] forCellReuseIdentifier:[MyMGCell getCellId]];
}

#pragma mark - table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyMGCell * rt = [tableView dequeueReusableCellWithIdentifier:[MyMGCell getCellId] forIndexPath:indexPath];
    
    
    
    return rt;
}


@end

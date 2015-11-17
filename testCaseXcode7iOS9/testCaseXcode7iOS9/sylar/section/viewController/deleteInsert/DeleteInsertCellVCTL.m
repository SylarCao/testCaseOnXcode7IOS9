//
//  DeleteInsertCellVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/17.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DeleteInsertCellVCTL.h"
#import "DeleteInsertCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DeleteInsertCellVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *data;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DeleteInsertCellVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = @[@"1", @"2", @"3", @"4"];
    [_tableView registerNib:[UINib nibWithNibName:@"DeleteInsertCell" bundle:nil] forCellReuseIdentifier:[DeleteInsertCell getCellId]];
}




#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rt = _data.count;
    return rt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeleteInsertCell *rt = [tableView dequeueReusableCellWithIdentifier:[DeleteInsertCell getCellId] forIndexPath:indexPath];
    [rt setWithContent:[[_data objectAtIndex:indexPath.row] integerValue]];
    return rt;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _data = @[@"5", @"6", @"7"];

    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}







@end

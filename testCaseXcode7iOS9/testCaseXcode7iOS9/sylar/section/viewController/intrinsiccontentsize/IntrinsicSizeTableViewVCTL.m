//
//  IntrinsicSizeTableViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/15.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "IntrinsicSizeTableViewVCTL.h"
#import "IntrinsicCell.h"
#import "IntrinsicDetailVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface IntrinsicSizeTableViewVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *data;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation IntrinsicSizeTableViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setWithData];
    
    [_tableView registerNib:[UINib nibWithNibName:@"IntrinsicCell" bundle:nil] forCellReuseIdentifier:[IntrinsicCell getCellId]];
    
    _tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.estimatedRowHeight = 40;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void) setWithData
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<40; i++)
    {
        NSString *str_i = [self getStringWithLength:(i%10)+1];
        [arr addObject:str_i];
    }
    _data = arr;
    
}

- (NSString *) getStringWithLength:(NSInteger)length
{
    NSString *az = @"abcdefghijklmnopqrstuvwxyz";
    NSString *rt = @"";
    for (int i=0; i<length; i++)
    {
        rt = [NSString stringWithFormat:@"%@_%@", rt, az];
    }
    return rt;
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rt = [_data count];
    return rt;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IntrinsicCell *rt = [tableView dequeueReusableCellWithIdentifier:[IntrinsicCell getCellId] forIndexPath:indexPath];
    
    [rt setWithContent:[_data objectAtIndex:indexPath.row] index:indexPath.row];
    
    
    return rt;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    IntrinsicDetailVCTL *dd = [[IntrinsicDetailVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:dd animated:YES];
}



@end

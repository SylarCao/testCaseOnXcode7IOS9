//
//  RefreshTableVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/4.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "RefreshTableVCTL.h"
#import "RefreshTableViewCell.h"
#import "MJRefresh.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RefreshTableVCTL ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *table;

@property (nonatomic, strong) MJRefreshNormalHeader *header;
@property (nonatomic, strong) MJRefreshAutoNormalFooter *footer;

@property (nonatomic, assign) NSInteger cellCount;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RefreshTableVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _cellCount = 20;
    
    // table
    [_table registerNib:[UINib nibWithNibName:@"RefreshTableViewCell" bundle:nil] forCellReuseIdentifier:[RefreshTableViewCell getCellId]];
    
    // refresh
    _header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDown)];
    _header.automaticallyChangeAlpha = YES;
    _header.lastUpdatedTimeLabel.hidden = YES;
    _table.header = _header;
    
    _footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self pullUp];
    }];
    _table.footer = _footer;
    
}


- (void) pullDown
{
    NSLog(@"pull down");
    [self performSelector:@selector(pullDownEnd) withObject:nil afterDelay:2];
}

- (void) pullDownEnd
{
    NSLog(@"end pull down");
    _cellCount = 20;
    [_header endRefreshing];
}

- (void) pullUp
{
    NSLog(@"up");
    if (_cellCount < 51)
    {
        [self performSelector:@selector(pullUpEnd) withObject:nil afterDelay:2];
    }
    else
    {
        [_footer endRefreshingWithNoMoreData];
    }
}

- (void) pullUpEnd
{
    NSLog(@"end pull up");
    _cellCount = _cellCount + 10;
    [_footer endRefreshing];
    [_table reloadData];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RefreshTableViewCell *rt = [tableView dequeueReusableCellWithIdentifier:[RefreshTableViewCell getCellId] forIndexPath:indexPath];
    [rt setWithContent:indexPath.row];
    return rt;
}




@end

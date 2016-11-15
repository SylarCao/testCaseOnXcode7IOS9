//
//  PullingTableViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PullingTableViewVCTL.h"
#import "NormalCell.h"
#import "PullingRefreshTableView.h"
#import "Masonry.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PullingTableViewVCTL ()
<UITableViewDelegate, UITableViewDataSource, PullingRefreshTableViewDelegate>

@property (nonatomic, strong) PullingRefreshTableView *table;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PullingTableViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setInitialValue];
}

- (void)setInitialValue
{
    // table
    
    _table = [[PullingRefreshTableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) pullingDelegate:self];
    _table.translatesAutoresizingMaskIntoConstraints = NO;
    _table.enableFooterPull = NO;
    _table.enableHeaderPull = YES;
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    _table.backgroundColor = [UIColor lightGrayColor];
    _table.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_table];
    [_table registerNib:[UINib nibWithNibName:[NormalCell getCellId] bundle:nil] forCellReuseIdentifier:[NormalCell getCellId]];

    
    // constraints
    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 0;
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
    }];
}

#pragma mark - PullingRefreshTableViewDelegate
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
    NSLog(@"sylar :  begin refresh ----- ");
    [self performSelector:@selector(endRefreshHead) withObject:nil afterDelay:3];
}

- (void)endRefreshHead
{
    if (_table.headerView.state == kPRStateLoading)
    {
        [_table tableViewDidFinishedLoading];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_table tableViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_table tableViewDidEndDragging:scrollView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NormalCell *rt = [tableView dequeueReusableCellWithIdentifier:[NormalCell getCellId] forIndexPath:indexPath];
    rt.content.text = [NSString stringWithFormat:@"index = %ld", indexPath.row];
    return rt;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView bringSubviewToFront:cell];
}

@end

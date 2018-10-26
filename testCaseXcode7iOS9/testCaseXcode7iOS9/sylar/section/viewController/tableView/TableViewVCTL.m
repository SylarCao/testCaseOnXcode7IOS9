//
//  TableViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/10.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TableViewVCTL.h"
#import "TableViewXIBCell.h"
#import "TableViewHeaderXIBView.h"
#import "TabelViewHeaderCodeView.h"
#import "TableViewCodeCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
BOOL const kTableViewVCTLXib = 0;
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TableViewVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger a1;
@property (nonatomic, assign) NSInteger a2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    
    if (kTableViewVCTLXib)
    {
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewXIBCell" bundle:nil] forCellReuseIdentifier:[TableViewXIBCell getCellId]];
        [_tableView registerNib:[UINib nibWithNibName:@"TableViewHeaderXIBView" bundle:nil] forHeaderFooterViewReuseIdentifier:[TableViewHeaderXIBView getCellId]];
    }
    else
    {
        [_tableView registerClass:[TableViewCodeCell class] forCellReuseIdentifier:[TableViewCodeCell getCellId]];
        [_tableView registerClass:[TabelViewHeaderCodeView class] forHeaderFooterViewReuseIdentifier:[TabelViewHeaderCodeView getCellId]];
    }
    
    // navigation
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"b1" style:UIBarButtonItemStylePlain target:self action:@selector(naviFun1)];
    self.navigationItem.rightBarButtonItem = item;
    
    // temp value
    self.a1 = 3;
    self.a2 = 4;
}

- (IBAction)btn1Action:(id)sender {
    self.a1 = 4;
    NSLog(@"sylar : aaa");
    [self.tableView reloadSections:[[NSIndexSet alloc ] initWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];  // reloadSections 的时候 当期的section的number可以变化，其他的section不可以变化
    NSLog(@"sylar : bbb");
}

- (IBAction)btn2Action:(id)sender {
//    self.a1 = 4;
    NSLog(@"sylar : aaa");
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:2]] withRowAnimation:UITableViewRowAnimationNone]; // reloadRowsAtIndexPaths 必须所有section的number都不能变化
    NSLog(@"sylar : bbb");
}

- (void)naviFun1 {
    NSLog(@"sylar :  navi fun1");
    
    [self.tableView reloadData];
    
    return;
    
//    if (kTableViewVCTLXib) {
//
//    } else {
//        TableViewCodeCell *cell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
//        [cell setSelected:YES animated:NO];
//    }
    
}

- (void)fun1:(id)sender {
    if ([sender isKindOfClass:[TableViewCodeCell class]]) {
        NSLog(@"sylar :  yes");
        [(TableViewCodeCell *)sender setSelected:YES animated:NO];
    } else {
        NSLog(@"sylar :  no");
    }
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    NSLog(@"sylar :  numberOfSectionsInTableView");
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"sylar :  numberOfRowsInSection(%ld)", section);
    NSInteger rt = section*2 + 2;
    if (section == 1) {
        rt = self.a1;
        NSLog(@"sylar : numberOfRowsInSection(%ld) = %ld", (long)section, (long)rt);
    }
    return rt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"sylar :  cellForRowAtIndexPath(%d, %d)", indexPath.section, indexPath.row);
    UITableViewCell *rt = nil;
    if (kTableViewVCTLXib)
    {
        TableViewXIBCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewXIBCell getCellId] forIndexPath:indexPath];
        [cell setWithIndex:indexPath.row];
        rt = cell;
    }
    else
    {
        TableViewCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableViewCodeCell getCellId] forIndexPath:indexPath];
        [cell setWithIndex:indexPath.row];
//        if (indexPath.row == 0) {
//            [self performSelectorOnMainThread:@selector(fun1:) withObject:cell waitUntilDone:NO];
//
//        }
        rt = cell;
    }
    
//    NSLog(@"rt.size = %f, %f", rt.frame.size.width,rt.frame.size.height);
    
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
//    NSLog(@"sylar : heightForHeaderInSection(%ld)", section);
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"sylar :  height (%ld, %ld)", indexPath.section, indexPath.row);
    return 40;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *rt = nil;
    if (kTableViewVCTLXib)
    {
        TableViewHeaderXIBView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[TableViewHeaderXIBView getCellId]];
        [header setWithHeaderIndex:section];
        rt = header;
    }
    else
    {
        TabelViewHeaderCodeView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[TabelViewHeaderCodeView getCellId]];
        [header setWithIndex:section];
        rt = header;
    }
    
    
    return rt;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
//    [tableView reloadSections:[[NSIndexSet alloc] initWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    // reload seciont 的时候   numberOfRowsInSection 会都掉
    //                        cellForRowAtIndexPath 只会调用对应的section
}





@end

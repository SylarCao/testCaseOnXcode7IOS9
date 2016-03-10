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
#define kTableViewVCTLXib  (0)
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TableViewVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableViewVCTL
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunreachable-code"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
}





#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rt = section*5 + 2;
    return rt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
        rt = cell;
    }
    
    
    
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
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

#pragma clang diagnostic pop



@end

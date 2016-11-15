//
//  NormalTableViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "NormalTableViewVCTL.h"
#import "NormalCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface NormalTableViewVCTL ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *table;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation NormalTableViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setInitialValue];
}


- (void)setInitialValue
{
    [_table registerNib:[UINib nibWithNibName:[NormalCell getCellId] bundle:nil] forCellReuseIdentifier:[NormalCell getCellId]];
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

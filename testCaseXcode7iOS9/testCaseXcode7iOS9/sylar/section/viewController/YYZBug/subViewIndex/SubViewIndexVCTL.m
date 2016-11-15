//
//  SubViewIndexVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SubViewIndexVCTL.h"
#import "IndexCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SubViewIndexVCTL ()
<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, weak) IBOutlet UITableView *table;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SubViewIndexVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setInitialValue];
}

- (void)setInitialValue
{
    [_table registerNib:[UINib nibWithNibName:[IndexCell getCellId] bundle:nil] forCellReuseIdentifier:[IndexCell getCellId]];
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
    IndexCell *rt = [tableView dequeueReusableCellWithIdentifier:[IndexCell getCellId] forIndexPath:indexPath];
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

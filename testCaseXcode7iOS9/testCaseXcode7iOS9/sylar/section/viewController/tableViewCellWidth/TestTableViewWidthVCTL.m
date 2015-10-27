//
//  TestTableViewWidthVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/26.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TestTableViewWidthVCTL.h"
#import "TestTableWidthTableViewCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TestTableViewWidthVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TestTableViewWidthVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setInitialValue];
}

- (void) setInitialValue
{
    CGRect bounds = self.view.bounds;
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height) style:UITableViewStylePlain];
    [table registerClass:[TestTableWidthTableViewCell class] forCellReuseIdentifier:[TestTableWidthTableViewCell getCellId]];
    table.delegate = self;
    table.dataSource = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
}






#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableWidthTableViewCell *rt = [tableView dequeueReusableCellWithIdentifier:[TestTableWidthTableViewCell getCellId] forIndexPath:indexPath];
    
    [rt setWithIndex:indexPath.row];
    
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}



@end

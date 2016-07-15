//
//  GestureScrollVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/7/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "GestureScrollVCTL.h"
#import "GestureScrollCell.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface GestureScrollVCTL ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *table;



@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation GestureScrollVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [_table registerNib:[UINib nibWithNibName:@"GestureScrollCell" bundle:nil] forCellReuseIdentifier:[GestureScrollCell getCellId]];
    
}




#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GestureScrollCell *rt = [tableView dequeueReusableCellWithIdentifier:[GestureScrollCell getCellId] forIndexPath:indexPath];
    
    
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end

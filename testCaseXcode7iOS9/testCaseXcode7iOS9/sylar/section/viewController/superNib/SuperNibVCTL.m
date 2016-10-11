//
//  SuperNibVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/10/11.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SuperNibVCTL.h"
#import "SuperNibCell2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SuperNibVCTL ()
<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, weak) IBOutlet UITableView *table;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SuperNibVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [_table registerNib:[UINib nibWithNibName:@"SuperNibCell1" bundle:nil] forCellReuseIdentifier:@"SuperNibCell1"];
    [_table registerNib:[UINib nibWithNibName:@"SuperNibCell2" bundle:nil] forCellReuseIdentifier:@"SuperNibCell2"];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *rt = nil;
    if (indexPath.row %2 == 0)
    {
        SuperNibCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperNibCell1" forIndexPath:indexPath];
        rt = cell;
    }
    else
    {
        SuperNibCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperNibCell2" forIndexPath:indexPath];
        rt = cell;
    }
    
    return rt;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuperNibCell1 *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell sayHello];
}


@end

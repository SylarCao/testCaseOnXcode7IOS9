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
    rt.content.backgroundColor = [[Helper share] getRandomColor];
    return rt;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"sylar :  shouldHighlightRowAtIndexPath = %ld,%ld", indexPath.section, indexPath.row);

    
    // 下边2行代码 可以 bringSubviewToFront  (ios10 && ios9 测试通过)
    [cell setHighlighted:YES animated:NO];
    [cell setHighlighted:NO animated:NO];
    
    //  下边的代码无法执行， 在didSelectRowAtIndexPath里，自动会把cell的z-order提高
    [_table bringSubviewToFront:cell];
    
    return NO;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"sylar :  didSelectRowAtIndexPath = %ld,%ld", indexPath.section, indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}




@end

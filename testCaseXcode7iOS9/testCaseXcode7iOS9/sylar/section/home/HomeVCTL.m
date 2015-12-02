//
//  HomeVCTL.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HomeVCTL.h"
#import "HomeTableViewCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HomeVCTL () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic, strong) NSArray *vctls;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HomeVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // data
    _vctls = @[@"testXibVCTL", @"NaviBarVCTL", @"ConstrainVCTL", @"TimerVCTL", @"MathProblem1VCTL", @"StatusBarVCTL",
               
               @"ShareWeiXinVCTL",
               @"MenuItemVCTL", @"JailBreakVCTL", @"DeleteInsertCellVCTL", @"JSPatchVCTL", @"ImageVCTL", @"CheckInstallQQVCTL",
               @"ReadPDFVCTL", @"DPLocationVCTL", @"RefreshTableVCTL", @"AttributeStringVCTL", @"TouchIDVCTL",
               @"NumberKeyboardVCTL", @"ReleaseModeVCTL", @"ContactListVCTL", @"TestTableViewWidthVCTL", @"PushNotificationVCTL",
               @"BuglyVCTL", @"JsonKitVCTL", @"MBProgressHudVCTL", @"SavePlistVCTL", @"IntrinsicSizeTableViewVCTL",
               @"StackViewVCTL", @"MGSwipeCellVCTL", @"LewPopupVCTL", @"ShakeTextFieldVCTL", @"PostNotificationVCTL",
               @"StringArrayVCTL", @"Touch3DVCTL", @"Touch3D1VCTL", @"DragCollectionView"];
    
    // table view
    [_table registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:[HomeTableViewCell getCellId]];
}


#pragma - table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rt = _vctls.count;
    return rt;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *rt = [tableView dequeueReusableCellWithIdentifier:[HomeTableViewCell getCellId] forIndexPath:indexPath];
    NSString *content = [_vctls objectAtIndex:indexPath.row];
    [rt setWithContent:content];
    return rt;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *the_vctl = [[NSClassFromString([_vctls objectAtIndex:indexPath.row]) alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:the_vctl animated:YES];
    
    
    
    
}

@end

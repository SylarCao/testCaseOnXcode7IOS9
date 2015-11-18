//
//  MenuItemVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/12.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MenuItemVCTL.h"
#import "MenuItemCell.h"
#import <Foundation/Foundation.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MenuItemVCTL ()
<UITableViewDataSource, UITableViewDelegate, MenuItemCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UILabel *lb1;



@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MenuItemVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerNib:[UINib nibWithNibName:@"MenuItemCell" bundle:nil] forCellReuseIdentifier:[MenuItemCell getCellId]];
    
    
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    MenuItemCell *rt = [tableView dequeueReusableCellWithIdentifier:[MenuItemCell getCellId] forIndexPath:indexPath];
    [rt setWithIndex:row];
    rt.delegate = self;
    return rt;
}


#pragma mark - MenuItemCellDelegate
- (void)MenuItemCellDidLongPressCell:(MenuItemCell *)cell
{
    NSIndexPath *index_path = [_tableView indexPathForCell:cell];
    NSLog(@"press = %ld", (long)index_path.row);
    
    UIMenuController *menu_controller = [[UIMenuController alloc] init];
    
    UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"title1" action:@selector(menuItemClick:)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"title2" action:@selector(menuItemClick:)];
    
    [menu_controller setMenuItems:@[item1, item2]];
    CGRect rect_cell = [_tableView convertRect:cell.frame toView:self.view];
    [menu_controller setTargetRect:rect_cell inView:self.view];
    [menu_controller update];
    
    [menu_controller setMenuVisible:YES animated:YES];
    
}

- (void) menuItemClick:(id)sender
{
    UIMenuItem *ii = (UIMenuItem *)sender;
    NSLog(@"click menu = %@", ii.title);
}



@end

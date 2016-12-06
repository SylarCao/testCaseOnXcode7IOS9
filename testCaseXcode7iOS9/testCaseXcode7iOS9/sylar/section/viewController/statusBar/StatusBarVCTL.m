//
//  StatusBarVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StatusBarVCTL.h"
#import "StatusBarTableViewCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StatusBarVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *table;

@property (nonatomic, strong) UIView *statusBarBkgView;


@property (nonatomic, assign) BOOL statusBarHidden;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StatusBarVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setMyStatusBarColor];
    
    
    [_table registerNib:[UINib nibWithNibName:@"StatusBarTableViewCell" bundle:nil] forCellReuseIdentifier:[StatusBarTableViewCell getCellId]];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [_statusBarBkgView removeFromSuperview];
    [self.navigationController setNavigationBarHidden:NO];
    
    [super viewWillDisappear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return _statusBarHidden;
}

- (void) setMyStatusBarColor
{
//    instruction: http://stackoverflow.com/questions/19063365/how-to-change-the-status-bar-background-color-and-text-color-on-ios-7
//    1) Set View controller-based status bar appearance to NO
//    2) Set Status bar style to UIStatusBarStyleLightContent
    
    [self.navigationController setNavigationBarHidden:YES];
    
    UIView *ss = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    ss.backgroundColor = [UIColor yellowColor];
    _statusBarBkgView = ss;
    [self.navigationController.view addSubview:ss];
}


- (IBAction) btnBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rt = 100;
    return rt;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusBarTableViewCell *rt = [tableView dequeueReusableCellWithIdentifier:[StatusBarTableViewCell getCellId] forIndexPath:indexPath];
    
    NSString *content = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    if (indexPath.row == 1)
    {
        content = @"ios9  status bar light";
    }
    else if (indexPath.row == 2)
    {
        content = @"ios9  status bar dark(default)";
    }
    else if (indexPath.row == 3)
    {
        content = @"ios10  status bar dark(default)";
    }
    else if (indexPath.row == 4)
    {
        content = @"ios10  status bar hide";
    }
    else if (indexPath.row == 5)
    {
        content = @"ios10  status bar show";
    }
    
    rt.textLabel.text = content;
    
    return rt;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        [self statusBarColorChangeLight];
    }
    else if (indexPath.row == 2)
    {
        [self statusBarColorChangeDark];
    }
    else if (indexPath.row == 3)
    {
        [self statusBarColorChange10];
    }
    else if (indexPath.row == 4)
    {
        [self statusBarHide10];
    }
    else if (indexPath.row == 5)
    {
        [self statusBarShow10];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

#pragma mark - helper
- (void)statusBarColorChangeLight
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];  // deprecated ok in ios10
}

- (void)statusBarColorChangeDark
{
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

#pragma clang diagnostic pop

- (void)statusBarColorChange10
{
    if (kIOSVersion(10))
    {
        //  make sure to add to your info.plist "View controller-based status bar appearance" set to YES otherwise things just don't seem to work
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (void)statusBarHide10
{
    if (kIOSVersion(10))
    {
        //  make sure to add to your info.plist "View controller-based status bar appearance" set to YES otherwise things just don't seem to work
        _statusBarHidden = YES;
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

- (void)statusBarShow10
{
    if (kIOSVersion(10))
    {
        //  make sure to add to your info.plist "View controller-based status bar appearance" set to YES otherwise things just don't seem to work
        _statusBarHidden = NO;
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

@end

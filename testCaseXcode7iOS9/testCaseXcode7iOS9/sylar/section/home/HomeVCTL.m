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
    NSArray *ctrls = @[@"YYZBugVCTL", @"BlurVCTL", @"GoToSettingVCTL", @"ThreadVCTL",
                       
                       
                
               @"sort", // 都放到这个后边
               @"CollectionViewVCTL", @"LayerVCTL", @"MasonryVCTL", @"TRYVCTL", @"SuperNibVCTL", @"TableViewCellVCTL",
               @"PushPopVCTL", @"GestureScrollVCTL", @"LabelTestVCTL", @"StructVCTL", @"FormatCodeVCTL", @"WindowVCTL",
               @"CategoryVCTL", @"AFNetworkingVCTL", @"SaveDataVCTL", @"PreFixVCTL", @"CFileVCTL", @"PlayVideoVCTL",
               @"WebViewVCTL", @"KVOVCTL", @"AnimationVCTL", @"CPlusVCTL", @"PickerVCTL", @"CameraVCTL", @"DownloadVCTL",
               @"UILabelVCTL", @"TestBlockVCTL", @"TableViewVCTL", @"ConstraintCodeVCTL", @"EncoderVCTL", @"OthersVCTL",
               @"testXibVCTL", @"FingerTapVCTL", @"XOptionVCTL", @"ScrollViewZoomVCTL", @"HorizonScrollVCTL",
               @"DeallocVCTL", @"DrawLineVCTL", @"MathProblem2VCTL", @"HorizontalVCTL", @"TouchEventVCTL", @"ResizeImageVCTL",
               @"ShareWeiXinVCTL", @"OpeniOS9VCTL", @"LifeTimeVCTL", @"ScreenFrameVCTL", @"ActionSheetVCTL", @"NavigationBarVCTL",
               @"MenuItemVCTL", @"JailBreakVCTL", @"DeleteInsertCellVCTL", @"JSPatchVCTL", @"ImageVCTL", @"CheckInstallQQVCTL",
               @"ReadPDFVCTL", @"DPLocationVCTL", @"RefreshTableVCTL", @"AttributeStringVCTL", @"TouchIDVCTL", @"TimerVCTL",
               @"NumberKeyboardVCTL", @"ReleaseModeVCTL", @"ContactListVCTL", @"TestTableViewWidthVCTL", @"PushNotificationVCTL",
               @"BuglyVCTL", @"JsonKitVCTL", @"MBProgressHudVCTL", @"SavePlistVCTL", @"IntrinsicSizeTableViewVCTL", @"StatusBarVCTL",
               @"StackViewVCTL", @"MGSwipeCellVCTL", @"LewPopupVCTL", @"ShakeTextFieldVCTL", @"PostNotificationVCTL",
               @"StringArrayVCTL", @"Touch3DVCTL", @"Touch3D1VCTL", @"DragCollectionVCTL", @"MathProblem1VCTL", @"ConstrainVCTL"];
    
    _vctls = [self sortArray:ctrls];
    
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
    NSString *content = [_vctls objectAtIndex:indexPath.row];
    if ([content isEqualToString:@"sort"] == NO)
    {
        UIViewController *the_vctl = [[NSClassFromString(content) alloc] initWithNibName:nil bundle:nil];
        if (the_vctl)
        {
            [self.navigationController pushViewController:the_vctl animated:YES];
        }
        else
        {
            NSString *cc = [NSString stringWithFormat:@"不存在 %@", content];
            [self showHudWithContent:cc];
        }
    }
}

- (NSArray *)sortArray:(NSArray *)array
{
    NSInteger dealloc_index = [array indexOfObject:@"sort"] + 1;
    NSArray *rt = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = NSOrderedSame;
        
        NSInteger index1 = [array indexOfObject:obj1];
        NSInteger index2 = [array indexOfObject:obj2];
        
        if (index1 < dealloc_index && index2 < dealloc_index)
        {
            result = NSOrderedSame;
        }
        else if (index1 < dealloc_index)
        {
            result = NSOrderedAscending;
        }
        else if (index2 < dealloc_index)
        {
            result = NSOrderedDescending;
        }
        else
        {
            NSString *s1 = obj1;
            NSString *s2 = obj2;
            result = [s1 compare:s2];
        }

        return result;
    }];
    return rt;
}

@end

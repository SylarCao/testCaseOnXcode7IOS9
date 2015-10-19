//
//  Touch3d1DetailVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/9.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "Touch3d1DetailVCTL.h"

@interface Touch3d1DetailVCTL ()

@end

@implementation Touch3d1DetailVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad - Touch3d1DetailVCTL ");
    // Do any additional setup after loading the view from its nib.
}

- (NSArray *)previewActionItems {
    
    UIPreviewAction *a1 = [UIPreviewAction actionWithTitle:@"title1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"press a1");
    }];
    UIPreviewAction *a2 = [UIPreviewAction actionWithTitle:@"title2" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"press a2");
    }];
    UIPreviewAction *a3 = [UIPreviewAction actionWithTitle:@"title3" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"press a3");
    }];
    
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Action 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 1 triggered");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Destructive Action" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Destructive Action triggered");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Selected Action" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Selected Action triggered");
    }];
    
    // add them to an arrary
    NSArray *actions = @[action1, action2, action3];
    
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"Action Group" style:UIPreviewActionStyleDefault actions:actions];
    
    NSArray *group = @[a1, a2, a3,group1];
    
    // and return them
    return group;
}


@end

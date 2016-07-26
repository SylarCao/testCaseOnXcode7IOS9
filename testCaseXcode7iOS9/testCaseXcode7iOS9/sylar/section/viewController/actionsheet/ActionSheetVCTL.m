//
//  ActionSheetVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/7.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ActionSheetVCTL.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ActionSheetVCTL ()
<UIActionSheetDelegate>

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ActionSheetVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    if (kIOSVersion(9))
    {
        UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"title" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *a1 = [UIAlertAction actionWithTitle:@"title 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self btnTap1];
        }];
        [sheet addAction:a1];
        
        UIAlertAction *a2 = [UIAlertAction actionWithTitle:@"title 2" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self btnTap2];
        }];
        [sheet addAction:a2];
        
        UIAlertAction *a3 = [UIAlertAction actionWithTitle:@"cancel 123" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self btnTap3];
        }];
        [sheet addAction:a3];
        
        [self presentViewController:sheet animated:YES completion:nil];
        
    }
    else
    {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"cancel button" destructiveButtonTitle:nil otherButtonTitles:@"o1", @"o2", @"o3", nil];
        
        NSArray *other_titles = @[@"o1", @"o2", @"other3"];
        UIActionSheet *sheet1 = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"cancel btn" destructiveButtonTitle:nil otherButtonTitles: nil];
        for (NSString *each in other_titles)
        {
            [sheet1 addButtonWithTitle:each];
        }
        
        
        [sheet1 showInView:self.view];
    }
}

- (IBAction)btn2:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"title" message:@"this is alert  message" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *a1 = [UIAlertAction actionWithTitle:@"title 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self btnTap1];
    }];
    [alert addAction:a1];
    
    UIAlertAction *a2 = [UIAlertAction actionWithTitle:@"title 2" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self btnTap2];
    }];
    [alert addAction:a2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"tap = %ld", buttonIndex);
}
#pragma clang diagnostic pop

- (void)btnTap1
{
    NSLog(@"tap 1");
}

- (void)btnTap2
{
    NSLog(@"tap 2");
}

- (void)btnTap3
{
    NSLog(@"tap 3 ");
}

@end

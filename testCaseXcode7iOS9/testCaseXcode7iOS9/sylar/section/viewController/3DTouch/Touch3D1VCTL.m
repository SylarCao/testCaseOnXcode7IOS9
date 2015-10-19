//
//  Touch3D1VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/9.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "Touch3D1VCTL.h"
#import "Touch3d1DetailVCTL.h"
#import <AudioToolbox/AudioToolbox.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface Touch3D1VCTL ()
<UIViewControllerPreviewingDelegate>

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation Touch3D1VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        NSLog(@"force touch ok");
    }
    else
    {
        NSLog(@"force touck NOT ok");
    }
    
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (IBAction)btn1:(id)sender
{
    [self shake1];
}

- (IBAction)btn2:(id)sender
{
    
}

- (void) shake1
{
//    AudioServicesPlaySystemSound(1000);//新邮件消息提示
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate); //震动
//    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    
//    SystemSound.Vibrate.PlayAlertSound()
}


- (void) fun1
{
    
}


#pragma mark - UIViewControllerPreviewingDelegate

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0)
{
    NSLog(@"return nil");
    Touch3d1DetailVCTL *d3 = [[Touch3d1DetailVCTL alloc] initWithNibName:nil bundle:nil];
    d3.preferredContentSize = CGSizeMake(200, 100);
    return d3;
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0)
{
    NSLog(@"void function");
    [self.navigationController pushViewController:viewControllerToCommit animated:YES];
}





@end

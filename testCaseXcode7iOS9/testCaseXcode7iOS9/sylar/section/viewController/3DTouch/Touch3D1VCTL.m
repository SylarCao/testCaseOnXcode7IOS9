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

@property (nonatomic, strong) UIImpactFeedbackGenerator *iiii;
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
    
//    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (IBAction)btn1:(id)sender
{
    [self shake1];
    
}

- (IBAction)btn2:(id)sender
{
    [self shake2];
}

- (void)shake2 {
    
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];  // not work on iphone6s ios11.3 SDK9.4
    _iiii = generator;
    [generator prepare];
    [generator impactOccurred];
}

- (void) shake1 {
//    AudioServicesPlaySystemSound(1000);//新邮件消息提示
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate); //震动
//    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    
//    AudioServicesPlaySystemSound (1352);  // 震动
    
//    AudioServicesPlaySystemSound(1519); // Actuate `Peek` feedback (weak boom)  普通短震，3D Touch 中 Peek 震动反馈
//    AudioServicesPlaySystemSound(1520); // Actuate `Pop` feedback (strong boom)  普通短震，3D Touch 中 Pop 震动反馈
//    AudioServicesPlaySystemSound(1521); // Actuate `Nope` feedback (series of three weak booms)  连续三次短震
    
//    SystemSound.Vibrate.PlayAlertSound();
    
    AudioServicesPlaySystemSoundWithCompletion(1520, ^{
        NSLog(@"sylar : cccc");
    });
    
//    AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate, ^{
//        NSLog(@"sylar : ccc");
//    });
    
    

//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
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

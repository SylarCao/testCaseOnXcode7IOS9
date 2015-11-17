//
//  JailBreakVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/16.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "JailBreakVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface JailBreakVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation JailBreakVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    BOOL jailbroken = [self checkJailBreak];
    if (jailbroken)
    {
        _lb1.text = @" is jailbroken";
    }
    else
    {
        _lb1.text = @" not jailbroken";
    }
}

- (BOOL)checkJailBreak
{
    BOOL jailbroken = NO;
    
    NSString *cydiaPath = @"/Applications/Cydia.app";
    
    NSString *aptPath = @"/private/var/lib/apt/";
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        
        jailbroken = YES;
        
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        
        jailbroken = YES;  
        
    }  
    
    return jailbroken;
}
@end

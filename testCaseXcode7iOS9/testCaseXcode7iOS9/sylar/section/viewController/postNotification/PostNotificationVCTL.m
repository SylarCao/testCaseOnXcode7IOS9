//
//  PostNotificationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/8.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PostNotificationVCTL.h"
#import "PostModel.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PostNotificationVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PostNotificationVCTL

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postFun1:) name:@"name123" object:nil];
}

- (void) postFun1:(NSNotification *)aNotification
{
    NSLog(@"receive");
    PostModel *mm = aNotification.object;
    [mm showLog];
    
    NSLog(@"user info = %@", aNotification.userInfo);
}

- (IBAction)btn1:(id)sender
{
    PostModel *pp = [[PostModel alloc] init];
    pp.p1 = @"pp1";
    pp.p2 = @"abcd";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"name123" object:pp userInfo:@{@"key1": @"value1111"}];
}

- (IBAction)btn2:(id)sender
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end

//
//  ScreenFrameVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/7.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ScreenFrameVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ScreenFrameVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ScreenFrameVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGRect rr = [UIScreen mainScreen].bounds;
    
    NSLog(@"size = %f, %f", rr.size.width, rr.size.height);
    
    
    // 5 for  (320, 568)
    // 6 for  (375,667)
    // 6p for (414, 736)
    
    
    _lb1.text = [NSString stringWithFormat:@"size = %f, %f", rr.size.width, rr.size.height];
    
    
}



@end

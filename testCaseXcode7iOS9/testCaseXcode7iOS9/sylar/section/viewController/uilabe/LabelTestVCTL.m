//
//  LabelTestVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/7/18.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "LabelTestVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface LabelTestVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation LabelTestVCTL


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self setWithLabel1];
    
    
    [self fun2];
}

- (void)fun2
{
    _lb1.adjustsFontSizeToFitWidth = YES;
    _lb1.text = @"123";
    
    _lb1.layer.borderColor = [UIColor redColor].CGColor;
    _lb1.layer.borderWidth = 1;
}

- (void)setWithLabel1
{
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 50, 300)];
    lb1.layer.borderColor = [UIColor redColor].CGColor;
    lb1.layer.borderWidth = 1;
    lb1.text = @"竖\n着\n排\n列\n的\n文\n字";
    lb1.numberOfLines = 0;
    [self.view addSubview:lb1];
}


- (IBAction)btn1:(id)sender
{
    _lb1.text = @"12344566778";
}

- (IBAction)btn2:(id)sender
{
    _lb1.text = @"aa";
}


@end

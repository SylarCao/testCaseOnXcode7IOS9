//
//  AttributeStringVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/11.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "AttributeStringVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface AttributeStringVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AttributeStringVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setInitialValue];
}

- (void) setInitialValue
{
    [self setWithLabel1];
    [self setWithLabel2];
}

- (void) setWithLabel1
{
    UILabel *lb = [[UILabel alloc] init];
    lb.layer.borderWidth = 1;
    lb.layer.borderColor = [UIColor blackColor].CGColor;
    
    lb.frame = CGRectMake(50, 80, 200, 50);
    
    NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:@"this is label 1" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    lb.attributedText = attr1;
    [self.view addSubview:lb];
}

- (void) setWithLabel2
{
    UILabel *lb = [[UILabel alloc] init];
    lb.layer.borderWidth = 1;
    lb.layer.borderColor = [UIColor blackColor].CGColor;
    lb.numberOfLines = 0;
    lb.frame = CGRectMake(50, 140, 200, 50);
    lb.backgroundColor = [UIColor greenColor];
    lb.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *muta_string = [[NSMutableAttributedString alloc] initWithString:@"line2 -- end" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"line1 \n" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    [muta_string insertAttributedString:str1 atIndex:0];
    
    lb.attributedText = muta_string;
    [self.view addSubview:lb];

}

+ (UILabel *) getOneLabel
{
    UILabel *lb = [[UILabel alloc] init];
    lb.numberOfLines = 0;
//    lb.frame = CGRectMake(50, 140, 200, 50);
    lb.backgroundColor = [UIColor greenColor];
    
    NSMutableAttributedString *muta_string = [[NSMutableAttributedString alloc] initWithString:@"line2 -- end" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"line1 \n" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    [muta_string insertAttributedString:str1 atIndex:0];
    
    lb.attributedText = muta_string;
    return lb;
}



@end

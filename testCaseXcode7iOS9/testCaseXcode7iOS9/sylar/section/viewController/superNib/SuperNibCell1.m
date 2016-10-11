//
//  SuperNibCell1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/10/11.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SuperNibCell1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SuperNibCell1()

@property (nonatomic, weak) IBOutlet UIView *v1;
@property (nonatomic, weak) IBOutlet UILabel *l1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SuperNibCell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)sayHello
{
    NSLog(@"hello 111111");
}

@end

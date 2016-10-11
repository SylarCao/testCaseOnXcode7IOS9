//
//  SuperNibCell2.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/10/11.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SuperNibCell2.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SuperNibCell2()

@property (nonatomic, weak) IBOutlet UIView *v2;
@property (nonatomic, weak) IBOutlet UILabel *l2;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SuperNibCell2

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
    [super sayHello];
    NSLog(@"hello 22222");
}




@end

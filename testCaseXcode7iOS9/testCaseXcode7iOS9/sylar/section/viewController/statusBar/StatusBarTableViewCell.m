//
//  StatusBarTableViewCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "StatusBarTableViewCell.h"
#import "Helper.h"

@implementation StatusBarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    UIColor *rand_color = [[Helper share] getRandomColor];
    
    self.contentView.backgroundColor = rand_color;
}


@end

//
//  NormalCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/15.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "NormalCell.h"

@implementation NormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
NSLog(@"sylar :  setSelected = %d (animation = %d)",selected, animated);
    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    NSLog(@"sylar :  setHighlighted = %d (animation = %d)",highlighted, animated);
}
//
//- (void)setNeedsLayout
//{
//    [super setNeedsLayout];
//    
//    NSLog(@"sylar :  setNeedsLayout");
//}
//
//- (void)setNeedsDisplay
//{
//    [super setNeedsDisplay];
//    NSLog(@"sylar :  setNeedsDisplay");
//}
//
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    NSLog(@"sylar :  layoutSubviews");
//}


@end

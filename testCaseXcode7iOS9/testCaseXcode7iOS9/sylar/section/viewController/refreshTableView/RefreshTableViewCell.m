//
//  RefreshTableViewCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/4.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "RefreshTableViewCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RefreshTableViewCell()

@property (nonatomic, weak) IBOutlet UILabel *lbContent;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RefreshTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void) setWithContent:(NSInteger)row
{
    NSString *content = [NSString stringWithFormat:@"i = %ld", row];
    _lbContent.text = content;
}

@end

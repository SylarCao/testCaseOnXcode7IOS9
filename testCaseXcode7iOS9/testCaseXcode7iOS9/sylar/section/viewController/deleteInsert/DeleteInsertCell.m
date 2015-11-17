//
//  DeleteInsertCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/17.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DeleteInsertCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DeleteInsertCell()

@property (nonatomic, weak) IBOutlet UILabel *lbContent;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DeleteInsertCell

- (void)awakeFromNib {
    // Initialization code
}

- (void) setWithContent:(NSInteger)index
{
    NSString *content = [NSString stringWithFormat:@"i = %ld", index];
    _lbContent.text = content;
}

@end

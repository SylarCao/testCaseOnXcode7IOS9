//
//  DragCollectionCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/12.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DragCollectionCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DragCollectionCell()

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DragCollectionCell

- (void)awakeFromNib {
    
    self.contentView.backgroundColor = [UIColor grayColor];
}


- (void) setWithContentIndex:(NSInteger)row
{
    _content.text = [NSString stringWithFormat:@"%ld", row];
}



@end

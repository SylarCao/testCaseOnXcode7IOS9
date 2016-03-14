//
//  TableViewXIBCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/10.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TableViewXIBCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TableViewXIBCell()

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableViewXIBCell

- (void)awakeFromNib {
    CGSize size = self.contentView.frame.size;
    NSLog(@"xib.size = %f, %f", size.width, size.height);

}

- (void)setWithIndex:(NSInteger)index
{
    _content.text = [NSString stringWithFormat:@"xib = %ld", index];
}




@end

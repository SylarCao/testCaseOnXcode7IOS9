//
//  HorizontalScrollCollectionCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/3.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizontalScrollCollectionCell.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizontalScrollCollectionCell()

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizontalScrollCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [[Helper share] getRandomColor];
}

- (void)setWithContent:(NSString *)content
{
    _content.text = content;
}

- (IBAction)btn1:(id)sender
{
    if ([_delegate respondsToSelector:@selector(HorizontalScrollCollectionCellDidTapButton)])
    {
        [_delegate performSelector:@selector(HorizontalScrollCollectionCellDidTapButton)];
    }
}

@end

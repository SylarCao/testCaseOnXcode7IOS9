//
//  MenuItemCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/12.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MenuItemCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MenuItemCell()

@property (nonatomic,weak) IBOutlet UILabel *lbContent;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MenuItemCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    UILongPressGestureRecognizer *long_tap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longTap:)];
    [self addGestureRecognizer:long_tap];
}

- (void)setWithIndex:(NSInteger) index
{
    _lbContent.text = [NSString stringWithFormat:@"index = %ld", (long)index];
}

- (void) longTap:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        if ([_delegate respondsToSelector:@selector(MenuItemCellDidLongPressCell:)])
        {
            [_delegate performSelector:@selector(MenuItemCellDidLongPressCell:) withObject:self];
        }
    }
}

@end

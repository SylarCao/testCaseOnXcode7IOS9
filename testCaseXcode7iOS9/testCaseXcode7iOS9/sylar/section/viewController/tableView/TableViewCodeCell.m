//
//  TableViewCodeCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/10.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TableViewCodeCell.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TableViewCodeCell()

@property (nonatomic, strong) UILabel *lbContent;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableViewCodeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setInitialValue];
    }
    return self;
}

- (void)setInitialValue
{
    _lbContent = [[UILabel alloc] init];
    [self.contentView addSubview:_lbContent];
    _lbContent.translatesAutoresizingMaskIntoConstraints = NO;
    _lbContent.layer.borderColor = [UIColor redColor].CGColor;
    _lbContent.layer.borderWidth = 1;
    
    // add constrains
    NSDictionary *dict = NSDictionaryOfVariableBindings(_lbContent);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[_lbContent]-2-|" options:0 metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_lbContent]-2-|" options:0 metrics:nil views:dict];
    [self.contentView addConstraints:c1];
    [self.contentView addConstraints:c2];
}

- (void)setWithIndex:(NSInteger)index
{
    _lbContent.text = [NSString stringWithFormat:@"code cell = %ld", index];
}


@end

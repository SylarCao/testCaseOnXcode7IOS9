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
        
        _lbContent.textColor = [UIColor blueColor];
//        self.contentView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        self.contentView.backgroundColor = [UIColor yellowColor];
        
        id aa = self.backgroundView;
        id bb = self.selectedBackgroundView;
        
        NSLog(@"sylar :  %@, %@", aa, bb);
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted)
    {
        _lbContent.textColor = [UIColor redColor];
        self.contentView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    }
    else
    {
        _lbContent.textColor = [UIColor blueColor];
        self.contentView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    }
}

- (void)setInitialValue
{
    CGSize size = self.contentView.frame.size;
    NSLog(@"code.size = %f, %f", size.width, size.height);
    
    _lbContent = [[UILabel alloc] init];
    [self.contentView addSubview:_lbContent];
    _lbContent.textColor = [UIColor blackColor];
    _lbContent.translatesAutoresizingMaskIntoConstraints = NO;
//    _lbContent.layer.borderColor = [UIColor redColor].CGColor;
//    _lbContent.layer.borderWidth = 1;
    
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

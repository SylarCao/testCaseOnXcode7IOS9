//
//  TestTableWidthTableViewCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/26.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TestTableWidthTableViewCell.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TestTableWidthTableViewCell()

@property (nonatomic, strong) UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TestTableWidthTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setInitialValue];
    }
    return self;
}

- (void) setInitialValue
{
    CGRect bounds = self.bounds;
    
    _lb1 = [[UILabel alloc] init];
    _lb1.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    _lb1.backgroundColor = [[Helper share] getRandomColor];
    [self.contentView addSubview:_lb1];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    NSLog(@"self.frame.size is %@", NSStringFromCGSize(self.frame.size));
    NSLog(@"self.contentView.frame.size is %@", NSStringFromCGSize(self.contentView.frame.size));
}

- (void) setWithIndex:(NSInteger)index
{
    _lb1.text = [NSString stringWithFormat:@"i = %ld", index];
}

@end

//
//  TableViewCell1.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/3.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "TableViewCell1.h"
#import "Masonry.h"

@implementation TableViewCell1

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
    UIView *pp_view  = self.contentView;
    
    
    // label
    UILabel *l1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    l1.text = @"init with style";
    l1.translatesAutoresizingMaskIntoConstraints = NO;
    [pp_view addSubview:l1];
    l1.userInteractionEnabled = YES;
    UITapGestureRecognizer *t1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ttt)];
    [l1 addGestureRecognizer:t1];
    
    // masonry
//    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(pp_view.mas_centerX).with.offset(0);
//        make.centerY.equalTo(pp_view.mas_centerY).with.offset(0);
//    }];
    
    // code
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:l1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:pp_view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:l1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:pp_view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [pp_view addConstraints:@[c1, c2]];
    
    self.backgroundColor = [UIColor blueColor];
    self.contentView.backgroundColor = [UIColor greenColor];
}

- (void)ttt
{
    NSLog(@"tap style");
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

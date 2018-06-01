//
//  TabelViewHeaderCodeView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/10.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TabelViewHeaderCodeView.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TabelViewHeaderCodeView() 

@property (nonatomic, strong) UILabel *content;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TabelViewHeaderCodeView

- (void)dealloc {
    NSLog(@"sylar : TabelViewHeaderCodeView dealloc");
}

+ (NSString *)getCellId
{
    NSString *rt = @"TabelViewHeaderCodeView_id";
    return rt;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        static int a = 1;
        NSLog(@"sylar : init = %d", a++);
        [self setInitialVaue];
    }
    return self;
}

- (void)setInitialVaue
{
    _content = [[UILabel alloc] init];
    _content.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_content];
    
    // add constrains
    NSDictionary *dict = NSDictionaryOfVariableBindings(_content);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[_content]-2-|" options:0 metrics:nil views:dict];
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_content]-2-|" options:0 metrics:nil views:dict];
    [self.contentView addConstraints:c1];
    [self.contentView addConstraints:c2];
}

- (void)setWithIndex:(NSInteger)index
{
    _content.text = [NSString stringWithFormat:@"code header = %ld", index];
}

@end

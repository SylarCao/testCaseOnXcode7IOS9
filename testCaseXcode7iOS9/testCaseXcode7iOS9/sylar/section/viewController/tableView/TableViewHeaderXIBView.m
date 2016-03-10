//
//  TableViewHeaderXIBView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/10.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TableViewHeaderXIBView.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TableViewHeaderXIBView()

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableViewHeaderXIBView

+ (NSString *)getCellId
{
    NSString *rt = @"TableViewHeaderXIBView_id";
    return rt;
}

- (void)setWithHeaderIndex:(NSInteger)index
{
    _content.text = [NSString stringWithFormat:@"header xib = %ld", index];
}



@end

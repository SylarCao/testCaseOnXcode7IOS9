//
//  HorizonScrollTitleCollectionCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/3.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "HorizonScrollTitleCollectionCell.h"
#import "Helper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface HorizonScrollTitleCollectionCell()

@property (nonatomic, weak) IBOutlet UILabel *content;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation HorizonScrollTitleCollectionCell

- (void)setWithContent:(NSString *)content
{
    _content.text = content;
}

@end

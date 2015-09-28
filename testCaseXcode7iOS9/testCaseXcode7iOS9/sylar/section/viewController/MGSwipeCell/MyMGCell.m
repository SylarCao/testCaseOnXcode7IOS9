//
//  MyMGCell.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MyMGCell.h"
#import "MGSwipeButton.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MyMGCell()





@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MyMGCell

+ (NSString *) getCellId
{
    NSString *rt = @"getCellId_id";
    return rt;
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setInitialValue];
        
    }
    return self;
}

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
    // add one label
    UILabel *lb = [[UILabel alloc] initWithFrame:self.bounds];
    lb.text = @"content 12345";
    [self.contentView addSubview:lb];
    
    MGSwipeButton *b1 = [MGSwipeButton buttonWithTitle:@"delete" backgroundColor:[UIColor redColor] callback:^BOOL(MGSwipeTableCell *sender) {
        [self cbDeleteButton];
        return YES;
    }];
    
    [b1 addTarget:self action:@selector(btnDelete) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightButtons = @[b1];
}

- (void) cbDeleteButton
{
    NSLog(@"cbDeleteButton");
}

- (void) btnDelete
{
    NSLog(@"btnDelete");
}


@end

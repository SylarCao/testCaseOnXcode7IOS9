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
#import "AttributeStringVCTL.h"
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
    
    
}

- (void) setWithTest
{
    [self setWithRightButtons];
}

- (void) setWithRightButtons
{
    MGSwipeButton *b1 = [MGSwipeButton buttonWithTitle:@"delete" backgroundColor:[UIColor redColor] callback:^BOOL(MGSwipeTableCell *sender) {
        [self cbDeleteButton];
        return YES;
    }];
    [b1 setPadding:20];
    
    MGSwipeButton *b2 = [MGSwipeButton buttonWithTitle:@"2222" backgroundColor:[UIColor blackColor] callback:^BOOL(MGSwipeTableCell *sender) {
        [self btn2];
        return NO;
    }];
    
    MGSwipeButton *b3 = [MGSwipeButton buttonWithTitle:@"333" backgroundColor:[UIColor blackColor] callback:^BOOL(MGSwipeTableCell *sender) {
        [self btn3];
        return YES;
    }];
    
    UILabel *lb1 = [self aCustomView];
    
    //    [b1 addTarget:self action:@selector(btnDelete) forControlEvents:UIControlEventTouchUpInside];
    self.allowsButtonsWithDifferentWidth = YES;
    self.rightSwipeSettings.transition = MGSwipeTransitionStatic;
    self.rightButtons = @[b1, b2, b3, lb1];
}

- (void) cbDeleteButton
{
    NSLog(@"cbDeleteButton");
}

- (void) btnDelete
{
    NSLog(@"btnDelete");
}

- (void) btn2
{
    NSLog(@"btn 2222");
}

- (void) btn3
{
    NSLog(@"bn 33333");
}

- (UILabel *) aCustomView
{
    UILabel *rt = [AttributeStringVCTL getOneLabel];
    return rt;
}

@end

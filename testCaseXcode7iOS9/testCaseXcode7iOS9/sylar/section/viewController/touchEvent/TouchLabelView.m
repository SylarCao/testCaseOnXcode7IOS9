//
//  TouchLabelView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/12/22.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import "TouchLabelView.h"
//#import "UILabel+YBAttributeTextTapAction.h"

@implementation TouchLabelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tt = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aaa)];
        [self addGestureRecognizer:tt];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)aaa {
    // 见vendor下的  YBAttributeTextTapAction 有bug
    // reference link: https://github.com/lyb5834/YBAttributeTextTapAction/commits/master/UILabel%2BYBAttributeTapAction-Demo/YBAttributeTextTapAction/UILabel%2BYBAttributeTextTapAction.m
    NSLog(@"sylar :  aaa");
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"begin");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"end");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"cancel");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"move");
}

@end

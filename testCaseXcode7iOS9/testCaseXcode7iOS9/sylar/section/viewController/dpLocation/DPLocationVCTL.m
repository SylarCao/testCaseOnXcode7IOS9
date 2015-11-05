//
//  DPLocationVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/2.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DPLocationVCTL.h"
#import "DPHelper.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DPLocationVCTL ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DPLocationVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btn1:(id)sender
{
    [[LocationHelper share] getLocationWithBlock:^(BOOL success, CLLocationDegrees longitude, CLLocationDegrees latitude) {
        if (success)
        {
            [[DPHelper share] refreshDataWithLongitude:longitude latitude:latitude block:^(BOOL success, NSString *data) {
                _textView.text = data;
            }];
        }
    }];
}


@end

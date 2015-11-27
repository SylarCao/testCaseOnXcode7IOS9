//
//  ImageVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/25.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ImageVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ImageVCTL ()

@property (nonatomic, weak) IBOutlet UIImageView *imgView;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ImageVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imgView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgView.layer.borderWidth = 0.5;
}

- (IBAction)btn1:(id)sender
{
    [self imageAppendImage];
}


- (void) imageAppendImage
{
    // reference link: http://stackoverflow.com/questions/9208951/ios-merging-two-images-of-different-size
    
    
    UIImage *im1 = [UIImage imageNamed:@"img_1"];
    UIImage *im2 = [UIImage imageNamed:@"sgs5"];
    
    CGSize total_size = CGSizeMake(200, 400);
    
    UIGraphicsBeginImageContext(total_size);
    [im1 drawInRect:CGRectMake(0, 0, 200, 200)];
    [im2 drawInRect:CGRectMake(0, 200, 200, 200)];
    
    UIImage *new_image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imgView.image = new_image;
    
    
    
}




@end

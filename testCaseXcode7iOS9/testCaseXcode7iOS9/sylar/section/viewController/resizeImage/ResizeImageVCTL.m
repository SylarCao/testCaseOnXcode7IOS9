//
//  ResizeImageVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/1/6.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ResizeImageVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ResizeImageVCTL ()

@property (nonatomic, strong) IBOutlet UIView *v1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ResizeImageVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self set1];
    
}

- (void)set1
{
    UIImage *img1 = [UIImage imageNamed:@"sgs5TH"];
    CGSize size = img1.size;
    UIImage *resize_img = [img1 resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0.5*size.width, 0, 0.5*size.width) resizingMode:UIImageResizingModeStretch];
    UIImageView *imv1 = [[UIImageView alloc] initWithFrame:_v1.bounds];
    imv1.image = resize_img;
    [_v1 addSubview:imv1];
}



@end

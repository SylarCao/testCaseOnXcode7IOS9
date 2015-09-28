//
//  StackViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "StackViewVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface StackViewVCTL ()

@property (nonatomic, weak) IBOutlet UIStackView *stackView;

@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSDictionary *dictImages;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation StackViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stackView1];
    
}


- (void) stackView1
{
    _stackView.backgroundColor = [UIColor greenColor];
    
    [_stackView setBackgroundColor:[UIColor yellowColor]];
    
    UIImageView *imv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgs1.jpg"]];
    [_stackView addArrangedSubview:imv1];
    imv1.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *imv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgs2.jpg"]];
    [_stackView addArrangedSubview:imv2];
    imv2.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImageView *imv3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sgs3.jpg"]];
    [_stackView addArrangedSubview:imv3];
    
    _images = [[NSArray alloc] initWithObjects:imv1, imv2, imv3, nil];
    
    _dictImages = [[NSDictionary alloc] initWithObjectsAndKeys:
                   imv1, @"k0",
                   imv2, @"k1",
                   imv3, @"k2",
                   nil];
    
}


- (IBAction)btn1:(id)sender
{
    UIImageView *imv = [_images objectAtIndex:0];
    imv.image = [UIImage imageNamed:@"sgs4.jpg"];
}


- (IBAction)btn2:(id)sender
{
    UIImageView *imv = [_dictImages objectForKey:@"k1"];
    imv.image = [UIImage imageNamed:@"sgs4.jpg"];
}

@end

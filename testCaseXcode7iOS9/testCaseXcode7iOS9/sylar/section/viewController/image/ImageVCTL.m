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

@property (nonatomic, weak) IBOutlet UIImageView *imv1;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ImageVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imgView.layer.borderColor = [UIColor whiteColor].CGColor;
    _imgView.layer.borderWidth = 0.5;
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    _imv1.layer.borderColor = [UIColor redColor].CGColor;
    _imv1.layer.borderWidth = 0.5;
    _imv1.contentMode = UIViewContentModeScaleAspectFit;
    
    
    [self fun2];
    
//    [self addCropImage];
}

- (IBAction)btn1:(id)sender
{
    
//    [self imageAppendImage];
    
//    [self imageCoverImage];
    
//    [self fun1];
}

- (void)fun2
{
    UIImage *aImage = [UIImage imageNamed:@"sgs7"];
    
    _imv1.image = aImage;
    // 图片的旋转
    
//    _imgView.image = aImage;
    
    
    CGImageRef imgRef = aImage.CGImage;
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, width, height);
    CGFloat scaleRatio = 1;
    CGFloat boundHeight;
    UIImageOrientation orient = aImage.imageOrientation;
    
    boundHeight = bounds.size.height;
    bounds.size.height = bounds.size.width;
    bounds.size.width = boundHeight;
    transform = CGAffineTransformMakeTranslation(0.0, width);
    transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
    UIGraphicsBeginImageContext(bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    _imgView.image = imageCopy;
    
}

- (void)fun1
{
    // scale image
    _imgView.contentMode = UIViewContentModeCenter;
    UIImage *image0 = [UIImage imageNamed:@"sgs7"];
    CGSize size = CGSizeMake(50, 80);
//    UIImage *i1 = [[Helper share] imageScaleFitToSize:size image:image0];
    UIImage *i1 = [[Helper share] imageScaleFillToSize:size image:image0];
    _imgView.image = i1;
}

- (void)addCropImage
{
    UIImage *s7 = [UIImage imageNamed:@"sgs7.png"];
    CGImageRef image_ref = CGImageCreateWithImageInRect(s7.CGImage, CGRectMake(0, 0, s7.size.width, s7.size.height-100));
    UIImage *crop_s7 = [UIImage imageWithCGImage:image_ref];
    CGImageRelease(image_ref);
    _imv1.image = crop_s7;
}

- (void) imageAppendImage
{
    // reference link: http://stackoverflow.com/questions/9208951/ios-merging-two-images-of-different-size
    
    
    UIImage *im1 = [UIImage imageNamed:@"img_1"];
    UIImage *im2 = [UIImage imageNamed:@"small_30"];
    
    CGSize total_size = CGSizeMake(200, 400);
    UIGraphicsBeginImageContext(total_size);
    [im1 drawInRect:CGRectMake(0, 0, 200, 200)];
    [im2 drawInRect:CGRectMake(0, 200, 200, 200)];
    
    UIImage *new_image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imgView.image = new_image;
    
}

- (void)imageCoverImage
{
    UIImage *im1 = [UIImage imageNamed:@"img_1"];
    UIImage *im2 = [UIImage imageNamed:@"small_30"];
    
    CGSize total_size = CGSizeMake(200, 400);
    UIGraphicsBeginImageContext(total_size);
    [im1 drawInRect:CGRectMake(0, 0, 200, 200)];
    [im2 drawInRect:CGRectMake(0, 0, 200, 200) blendMode:kCGBlendModeNormal alpha:0.3];
    
    UIImage *new_image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imgView.image = new_image;
}




@end

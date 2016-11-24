//
//  UIImage+ScreenShot.m
//  CustomTabViewController
//
//  Created by Yorke on 16/2/12.
//  Copyright © 2016年 WuTong. All rights reserved.
//

#import "UIImage+ScreenShot.h"

@implementation UIImage (ScreenShot)

+ (UIImage *)beginImageContext:(CGRect)rect View:(UIView *)view{
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(viewImage.CGImage, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    return sendImage;
}

@end

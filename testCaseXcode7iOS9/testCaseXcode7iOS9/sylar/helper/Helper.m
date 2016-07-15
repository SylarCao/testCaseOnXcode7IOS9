//
//  Helper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/9/25.
//  Copyright © 2015年 sylar. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (instancetype) share
{
    static Helper *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[Helper alloc] init];
    });
    return inst;
}

- (UIColor *) getRandomColor
{
    UIColor *rt = [self getRandomColorWithAlpha:1];
    return rt;
}

- (UIColor *)getRandomColorWithAlpha:(CGFloat)alpha
{
    NSInteger r = arc4random()%250;
    NSInteger g = arc4random()%250;
    NSInteger b = arc4random()%250;
    
    UIColor *rt = [UIColor colorWithRed:r/255.9 green:g/255.9 blue:b/255.9 alpha:alpha];
    return rt;
}

- (UIColor *)getColor:(UIColor *)color alpha:(CGFloat)alpha
{
    const CGFloat *cg_color = CGColorGetComponents(color.CGColor);
    
    CGFloat red = cg_color[0];
    CGFloat green = cg_color[1];
    CGFloat blue = cg_color[2];
    
    UIColor *rt = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return rt;
}


- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (NSString *) getVersion
{
    NSString *rt = [UIDevice currentDevice].systemVersion;
    return rt;
}

- (BOOL) checkVersion:(NSInteger)version
{
    BOOL rt = NO;
    NSString *current_version = [self getVersion];
    if (version == [current_version integerValue])
    {
        rt = YES;
    }
    return rt;
}

- (BOOL) checkSimulator
{
//    UIDevice *current = [UIDevice currentDevice];
//    NSString *name = current.name;
//    NSString *model = current.model;
//    NSString *localizedModel = current.localizedModel;
//    NSString *systemName = current.systemName;
//    NSString *systemVersion = current.systemVersion;
//    
//    NSLog(@"name = %@", name);
//    NSLog(@"model = %@", model);
//    NSLog(@"localizedModel = %@", localizedModel);
//    NSLog(@"systemName = %@", systemName);
//    NSLog(@"systemVersion = %@", systemVersion);
//    
//    BOOL b1 = TARGET_OS_IPHONE;   // always 1 on simulator or ipad
    BOOL rt = TARGET_OS_SIMULATOR;

    return rt;
}

- (NSString *)getHomeDocumentsPath
{
    NSString *rt = [NSString stringWithFormat:@"%@/Documents", NSHomeDirectory()];
    return rt;
}

- (UIImage *)imageScaleToSize:(CGSize)size image:(UIImage *)aImage
{
    // Scalling selected image to targeted size
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, size.width, size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
    CGContextClearRect(context, CGRectMake(0, 0, size.width, size.height));
    
    if(aImage.imageOrientation == UIImageOrientationRight)
    {
        CGContextRotateCTM(context, -M_PI_2);
        CGContextTranslateCTM(context, -size.height, 0.0f);
        CGContextDrawImage(context, CGRectMake(0, 0, size.height, size.width), aImage.CGImage);
    }
    else
        CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), aImage.CGImage);
    
    CGImageRef scaledImage=CGBitmapContextCreateImage(context);
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    UIImage *image = [UIImage imageWithCGImage: scaledImage];
    
    CGImageRelease(scaledImage);
    
    return image;
}

- (UIImage *)imageScaleFillToSize:(CGSize)size image:(UIImage *)aImage
{
    CGFloat scale_width = aImage.size.width/size.width;
    CGFloat scale_height = aImage.size.height/size.height;
    scale_width = MAX(1, scale_width);
    scale_height = MAX(1, scale_height);
    
    CGFloat scale = MIN(scale_width, scale_height);
    UIImage *rt = [self imageScaleToSize:CGSizeMake(aImage.size.width/scale, aImage.size.height/scale) image:aImage];
    
    return rt;
}

- (UIImage *)imageScaleFitToSize:(CGSize)size image:(UIImage *)aImage
{
    CGFloat scale_width = aImage.size.width/size.width;
    CGFloat scale_height = aImage.size.height/size.height;
    scale_width = MAX(1, scale_width);
    scale_height = MAX(1, scale_height);
    
    CGFloat scale = MAX(scale_width, scale_height);
    UIImage *rt = [self imageScaleToSize:CGSizeMake(aImage.size.width/scale, aImage.size.height/scale) image:aImage];
    
    return rt;
}



@end

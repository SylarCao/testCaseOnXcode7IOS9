//
//  UIImage+ImageEffects.h
//  CustomTabViewController
//
//  Created by Yorke on 16/2/12.
//  Copyright © 2016年 WuTong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageEffects)

- (UIImage *)blurImage;


- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end

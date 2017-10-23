//
//  ColorView.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/10/10.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "ColorView.h"

@interface ColorView ()

@property (nonatomic, strong) UIColor *color1;
@property (nonatomic, strong) UIColor *color2;

@end

@implementation ColorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        _color1 = [UIColor redColor];
        _color2 = [UIColor whiteColor];
    }
    return self;
}

- (void)setRangeColor:(UIColor *)color1 anotherColor:(UIColor *)color2 {
    _color1 = color1;
    _color2 = color2;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, rect);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = [self createGradientWithColors:@[_color1, _color2] locations:@[@0, @1]];
    CGPoint startPoint = CGPointMake(rect.size.width/2, 0);
    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height);

    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation|kCGGradientDrawsBeforeStartLocation);
}

#pragma mark - helper

- (CGGradientRef)createGradientWithColors:(NSArray*)colorsArray locations:(NSArray*)locationsArray {
    int count = [colorsArray count];
    
    CGFloat* components = malloc(sizeof(CGFloat)*4*count);
    CGFloat* locations = malloc(sizeof(CGFloat)*count);
    
    for (int i = 0; i < count; ++i) {
        UIColor* color = [colorsArray objectAtIndex:i];
        NSNumber* location = (NSNumber*)[locationsArray objectAtIndex:i];
        size_t n = CGColorGetNumberOfComponents(color.CGColor);
        const CGFloat* rgba = CGColorGetComponents(color.CGColor);
        if (n == 2) {
            components[i*4] = rgba[0];
            components[i*4+1] = rgba[0];
            components[i*4+2] = rgba[0];
            components[i*4+3] = rgba[1];
        } else if (n == 4) {
            components[i*4] = rgba[0];
            components[i*4+1] = rgba[1];
            components[i*4+2] = rgba[2];
            components[i*4+3] = rgba[3];
        }
        locations[i] = [location floatValue];
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGBitmapContextGetColorSpace(context);
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, components, locations, count);
    free(components);
    free(locations);
    return gradient;
}


@end

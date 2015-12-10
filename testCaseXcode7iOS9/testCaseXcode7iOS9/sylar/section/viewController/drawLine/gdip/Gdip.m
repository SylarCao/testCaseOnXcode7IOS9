#import "Gdip.h"
#define kFloatCompareZero		0.0000001

@implementation Gdip

+ (void)fillRect:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, YES);
        CGContextSetRGBFillColor(gc, red, green, blue, alpha);
        CGContextFillRect(gc, rt);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void)drawRect:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, YES);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        CGContextSetLineWidth(gc, 1.0);
        CGContextAddRect(gc, rt);
        CGContextStrokePath(gc);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void)drawRect:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr width:(int)width allowsAntialiasing:(BOOL)allowsAntialiasing
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, allowsAntialiasing);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        CGContextSetLineWidth(gc, width);
        CGContextStrokeRect(gc, rt);
        CGContextStrokePath(gc);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void)drawRect2:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr width:(int)width
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, YES);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        CGContextSetLineWidth(gc, width);
        CGContextStrokeRect(gc, rt);
        CGContextStrokePath(gc);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void)drawRoundRect:(CGContextRef)gc rt:(CGRect)rt ovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight clr:(UIColor *)clr
{
    float fw, fh;
    
    if (gc != nil)
    {
        float red, green, blue, alpha;
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        
        CGContextSaveGState(gc);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        
        if ((ovalWidth > -1 * kFloatCompareZero && ovalWidth < kFloatCompareZero) ||
            (ovalHeight > -1 * kFloatCompareZero && ovalHeight < kFloatCompareZero))
        {
            CGContextAddRect(gc, rt);
        }
        else
        {
            CGContextTranslateCTM(gc, CGRectGetMinX(rt), CGRectGetMinY(rt));
            CGContextScaleCTM(gc, ovalWidth, ovalHeight);
            fw = CGRectGetWidth(rt) / ovalWidth;
            fh = CGRectGetHeight(rt) / ovalHeight;
            CGContextSetAllowsAntialiasing(gc, YES);
            CGContextMoveToPoint(gc, fw, fh/2);  // Start at lower right corner
            CGContextAddArcToPoint(gc, fw, fh, fw/2, fh, 1);  // Top right corner
            CGContextAddArcToPoint(gc, 0, fh, 0, fh/2, 1); // Top left corner
            CGContextAddArcToPoint(gc, 0, 0, fw/2, 0, 1); // Lower left corner
            CGContextAddArcToPoint(gc, fw, 0, fw, fh/2, 1); // Back to lower right
            CGContextClosePath(gc);
        }
        CGContextRestoreGState(gc);
    }
}

+ (void) drawLine:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr width:(float)width
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, YES);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        CGContextSetLineWidth(gc, width);
        CGContextAddLines(gc, pts, count);
        CGContextStrokePath(gc);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void)drawCurveLine:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr width:(float)width allowsAntialiasing:(BOOL)antialiasing
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, antialiasing);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        CGContextSetLineWidth(gc, width);
        
        CGContextMoveToPoint(gc, pts[0].x, pts[0].y);
        for (int i = 0; i < count-1; i++)
        {
            CGContextAddQuadCurveToPoint(gc, pts[i].x, pts[i].y, (pts[i].x + pts[i+1].x) * 0.5, (pts[i].y + pts[i+1].y) * 0.5);
        }
        if (count > 1) CGContextAddLineToPoint(gc, pts[count-1].x, pts[count-1].y);
        CGContextStrokePath(gc);
        CGContextSetAllowsAntialiasing(gc, YES);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void) drawDashLine:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr width:(float)width
{
    if (gc != nil)
    {
        float red, green, blue, alpha;
        [self getCGColorFloat:clr red:&red green:&green blue:&blue alpha:&alpha];
        
        CGFloat dash[2];
        dash[0] = 2;
        dash[1] = 2;
        
        //		CGFloat dash[2];
        //		dash[0] = 2;
        //		dash[1] = 3;
        
        CGContextSaveGState(gc);
        CGContextSetAllowsAntialiasing(gc, YES);
        CGContextSetLineDash(gc, 0, dash, 2);
        CGContextSetRGBStrokeColor(gc, red, green, blue, alpha);
        CGContextSetLineWidth(gc, width);
        CGContextAddLines(gc, pts, count);
        CGContextStrokePath(gc);
        CGContextFlush(gc);
        CGContextRestoreGState(gc);
    }
}

+ (void)drawTextToContext:(NSString *)str pt:(CGPoint)pt clr:(UIColor *)clr
{
    if(!str) return;
    
    UIFont   *font    = [UIFont systemFontOfSize:16];
    [str drawAtPoint:pt withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:clr}];
}

+ (void)drawStringInRect2:(BOOL)isbold fontsize:(int)fontsize isvercenter:(BOOL)isvercenter str:(NSString *)str rect:(CGRect)rect alignment:(NSTextAlignment)alignment clr:(UIColor *)clr
{
    if (str != nil)
    {
        CGRect nrt;
        UIFont *font;
        
        if (isbold)
            font = fontsize == 0 ? [UIFont boldSystemFontOfSize:16] : [UIFont boldSystemFontOfSize:fontsize];
        else
            font = fontsize == 0 ? [UIFont boldSystemFontOfSize:16] : [UIFont boldSystemFontOfSize:fontsize];
        
        if (isvercenter)
        {
            nrt.origin.x = rect.origin.x;
            nrt.origin.y = rect.origin.y + (rect.size.height - (font.xHeight + font.capHeight)) / 2;
            nrt.size.height = (font.xHeight + font.capHeight);
            nrt.size.width = rect.size.width;
        }
        else
            nrt = rect;
        
        str = [self getDspString:str font:font dspRect:rect];
        [clr set];
        [str drawInRect:nrt withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:alignment];
    }
}

+ (void)drawStringInRectEx:(BOOL)isbold fontsize:(int)fontsize isvercenter:(BOOL)isvercenter str:(NSString *)str rect:(CGRect)rect alignment:(NSTextAlignment)alignment breakmode:(NSLineBreakMode)brakmode clr:(UIColor *)clr
{
    if (str != nil)
    {
        CGRect nrt;
        UIFont *font;
        
        if (isbold)
            font = fontsize == 0 ? [UIFont boldSystemFontOfSize:16] : [UIFont boldSystemFontOfSize:fontsize];
        else
            font = fontsize == 0 ? [UIFont boldSystemFontOfSize:16] : [UIFont boldSystemFontOfSize:fontsize];
        
        if (isvercenter)
        {
            nrt.origin.x = rect.origin.x;
            nrt.origin.y = rect.origin.y + (rect.size.height - (font.xHeight + font.capHeight)) / 2;
            nrt.size.height = (font.xHeight + font.capHeight);
            nrt.size.width = rect.size.width;
        }
        else
            nrt = rect;
        
        [clr set];
        [str drawInRect:nrt withFont:font lineBreakMode:brakmode alignment:alignment];
    }
}

+ (void)clearRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextClearRect(context, rect);
    CGContextFlush(context);
    CGContextRestoreGState(context);
}

+ (NSString*)getDspString:(NSString*)string font:(UIFont*)font dspRect:(CGRect)rect
{
    NSString *strVal = string;
    int n1 = [string length];
    int n2 = [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    
    if (n1 == n2)
    {
        CGSize constraintSize = CGSizeMake(300.0f, MAXFLOAT);

        NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        CGRect recttmp = [string boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        CGSize labelSize = recttmp.size;
        
        if (labelSize.width > rect.size.width)
        {
            for (int i = 1; i< n1; i++)
            {
                strVal      = [strVal substringWithRange:NSMakeRange(0, n1-i)];
                
                NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
                CGRect recttmp = [strVal boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
                labelSize = recttmp.size;
                
                if (labelSize.width <= rect.size.width) break;
            }
        }
    }
    
    return strVal;
}

+ (CGSize)getDspStringSize:(NSString *)string font:(UIFont*)font
{
    CGSize constraintSize = CGSizeMake(300.0f, MAXFLOAT);
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect recttmp = [string boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGSize labelSize = recttmp.size;
    
    return labelSize;
}

+ (void)drawStringInRect:(BOOL)isautosize str:(NSString *)str rect:(CGRect)rect alignment:(NSTextAlignment)alignment clr:(UIColor *)clr
{
    if (str != nil)
    {
        UIFont *font = [UIFont systemFontOfSize:16];
        if (isautosize == YES)
        {
            CGFloat fontsize;
            [str sizeWithFont:font minFontSize:9.0 actualFontSize:&fontsize forWidth:rect.size.width lineBreakMode:NSLineBreakByTruncatingMiddle];
            font = [UIFont systemFontOfSize:fontsize];
        }
        [clr set];
        [str drawInRect:rect withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:alignment];
    }
}

+ (void)drawStringInRect:(NSString *)str rect:(CGRect)rect font:(UIFont *)font alignment:(NSTextAlignment)alignment clr:(UIColor *)clr
{
    if (str != nil)
    {
        [clr set];
        [str drawInRect:rect withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:alignment];
    }
}

+ (void)fillPolygon:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr
{
    CGContextSaveGState(gc);
    CGContextSetAllowsAntialiasing(gc, YES);
    CGContextBeginPath(gc);
    CGContextAddLines(gc, pts, count);
    CGContextClosePath(gc);
    CGContextSetFillColorWithColor(gc, clr.CGColor);
    CGContextFillPath(gc);
    //CGContextSetAllowsAntialiasing(gc, YES);
    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}
+ (void)fillPolygonInRect:(CGContextRef)gc rt:(CGRect)rt pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr
{
    CGContextSaveGState(gc);
    CGContextClipToRect(gc, rt);
    CGContextSetAllowsAntialiasing(gc, YES);
    CGContextBeginPath(gc);
    CGContextAddLines(gc, pts, count);
    CGContextClosePath(gc);
    CGContextSetFillColorWithColor(gc, clr.CGColor);
    CGContextFillPath(gc);
    CGContextFlush(gc);
    CGContextRestoreGState(gc);
}

// 渐变填充矩形
+ (void)buildCGGradientColors:(UIColor **)colors clrNum:(NSInteger)clrNum colorComponents:(CGFloat *)colorComponents
{
    for (int i = 0; i < clrNum; i++)
    {
        UIColor *color				= colors[i];
        const CGFloat *components	= CGColorGetComponents(color.CGColor);
        
        for (int j = 0; j < 4; j++)
            colorComponents[i * 4 + j] = components[j];
    }
}

+ (void)fillGradientRect:(CGContextRef)gc rt:(CGRect)rt colors:(UIColor **)colors clrNum:(NSInteger)clrNum
{
    CGGradientDrawingOptions options = 0;
    
    CGPoint start	= CGPointMake(rt.origin.x, rt.origin.y);
    CGPoint end		= CGPointMake(rt.origin.x, rt.origin.y + rt.size.height);
    options			|= kCGGradientDrawsBeforeStartLocation;
    options			|= kCGGradientDrawsAfterEndLocation;
    
    CGFloat colorComponents[clrNum * 4];
    [self buildCGGradientColors:colors clrNum:clrNum colorComponents:colorComponents];
    CGContextSaveGState(gc);
    CGContextClipToRect(gc, CGRectMake(start.x, start.y, rt.size.width, rt.size.height));
    CGColorSpaceRef rgb		= CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient	= CGGradientCreateWithColorComponents(rgb, colorComponents, NULL, clrNum);
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(gc, gradient, start, end, options);
    CGGradientRelease(gradient);
    CGContextRestoreGState(gc);
}

+ (void)fillGradientPolygon:(CGContextRef)gc rt:(CGRect)rt pts:(CGPoint *)pts count:(int)count colors:(UIColor **)colors clrNum:(NSInteger)clrNum
{
    CGGradientDrawingOptions options = 0;
    CGPoint start	= CGPointMake(rt.origin.x, rt.origin.y);
    CGPoint end		= CGPointMake(rt.origin.x, rt.origin.y + rt.size.height);
    options			|= kCGGradientDrawsBeforeStartLocation;
    options			|= kCGGradientDrawsAfterEndLocation;
    
    CGContextSaveGState(gc);
    CGContextSetBlendMode(gc,kCGBlendModeColorDodge);//设置混合模式 modify by wutongr 20150703
    CGContextBeginPath(gc);
    CGContextMoveToPoint(gc, pts[0].x, rt.origin.y + rt.size.height);
    CGContextAddLineToPoint(gc, pts[0].x, pts[1].y);
    
    for (int i = 0; i < count-1; i++)
    {
        CGContextAddQuadCurveToPoint(gc, pts[i].x, pts[i].y, (pts[i].x + pts[i+1].x) * 0.5, (pts[i].y + pts[i+1].y) * 0.5);
    }
    
    CGContextAddLineToPoint(gc, pts[count-1].x, pts[count-1].y);
    CGContextAddLineToPoint(gc, pts[count-1].x, rt.origin.y + rt.size.height);
    CGContextAddLineToPoint(gc, pts[0].x, rt.origin.y + rt.size.height);
    
    CGFloat colorComponents[clrNum * 4];
    [self buildCGGradientColors:colors clrNum:clrNum colorComponents:colorComponents];
    
    CGContextClosePath(gc);
    CGContextClip(gc);
    CGColorSpaceRef rgb		= CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient	= CGGradientCreateWithColorComponents(rgb, colorComponents, NULL, clrNum);
    CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(gc, gradient, start, end, options);
    CGGradientRelease(gradient);
    CGContextRestoreGState(gc);
}

+ (void)drawImage:(CGContextRef)gc rt:(CGRect)rt imgRef:(CGImageRef)imgRef alpha:(CGFloat)alpha
{
    CGContextSaveGState(gc);
    CGContextTranslateCTM(gc, 0, rt.size.height);
    CGContextScaleCTM(gc, 1.0, -1.0);
    CGContextDrawImage(gc, rt, imgRef);
    CGContextSetGrayFillColor(gc, 0.0, alpha);
    CGContextRestoreGState(gc);
}

+ (void)drawImage:(CGContextRef)gc rt:(CGRect)rt img:(UIImage*)img blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
    CGContextSaveGState(gc);
    [img drawInRect:rt blendMode:blendMode alpha:alpha];
    CGContextSetGrayFillColor(gc, 0.0, alpha);
    CGContextRestoreGState(gc);
}

+ (int)getCenterIndex:(NSString*)string font:(UIFont*)font
{
    int n1 = [string length];
    
    CGSize constraintSize = CGSizeMake(30000.0f, MAXFLOAT);
    
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect recttmp = [string boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    CGSize labelSize = recttmp.size;
    
    int value = 1;
    
    int half = labelSize.width / 2;
    
    for (int i = 1; i < n1; i++) 
    {
        NSString *str = [string substringToIndex:i];
        
        NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
        CGRect recttmp = [str boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
        CGSize subSize = recttmp.size;
        
        if (subSize.width >= half) 
        {
            value = i;
            break;
        }
    }
    return value;
}

+ (UIImage *)getRetinaImageWithContentsOfFile:(NSString *)imagePath
{
    UIImage *img        = [UIImage imageWithContentsOfFile:imagePath];
    CGImageRef cgimage  = img.CGImage;
    img                 = [UIImage imageWithCGImage:cgimage scale:2.0 orientation:UIImageOrientationUp];
    
    return img;
}

+ (UIImage *)getRetinaImage:(NSString *)resourceImage
{
    UIImage *img        = [UIImage imageNamed:resourceImage];//LOADIMAGE(resourceImage, nil);
    CGImageRef cgimage  = img.CGImage;
    img                 = [UIImage imageWithCGImage:cgimage scale:2.0 orientation:UIImageOrientationUp];
    
    return img;
}

+ (UIImage *)getImageWithScaleFactor:(NSString *)resourceImage factor:(CGFloat)factor
{
    UIImage *img        = [UIImage imageNamed:resourceImage];
    CGImageRef cgimage  = img.CGImage;
    img                 = [UIImage imageWithCGImage:cgimage scale:factor orientation:UIImageOrientationUp];
    
    return img;
}

#pragma mark - getCGColorFloat
+ (void)getCGColorFloat:(UIColor *)uicolor red:(float *)red green:(float *)green blue:(float *)blue alpha:(float *)alpha
{
    CGColorRef c            = uicolor.CGColor;
    const CGFloat * colors  = CGColorGetComponents(c);
    
    float _red      = colors[0];
    float _green    = colors[1];
    float _blue     = colors[2];
    float _alpha    = colors[3];
    
    *red	= _red;
    *green  = _green;
    *blue	= _blue;
    *alpha  = _alpha;
}
@end

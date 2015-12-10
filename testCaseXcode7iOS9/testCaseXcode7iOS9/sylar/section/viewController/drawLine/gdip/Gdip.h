#import "Util.h"

@interface Gdip : NSObject 
{
}

// 填充一个矩形
+ (void)fillRect:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr;

// 绘制直线
+ (void)drawLine:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr width:(float)width;
+ (void)drawCurveLine:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr width:(float)width allowsAntialiasing:(BOOL)antialiasing;

// 绘制点画线
+ (void) drawDashLine:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr width:(float)width;

// 绘制一个矩形
+ (void)drawRect:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr;
+ (void)drawRect:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr width:(int)width allowsAntialiasing:(BOOL)allowsAntialiasing;
+ (void)drawRect2:(CGContextRef)gc rt:(CGRect)rt clr:(UIColor *)clr width:(int)width;
+ (void)drawRoundRect:(CGContextRef)gc rt:(CGRect)rt ovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight clr:(UIColor *)clr;

// 绘制一个字符串到屏幕
+ (void)drawTextToContext:(NSString *)str pt:(CGPoint)pt clr:(UIColor *)clr;

// 在一个矩形范围内绘制字符串,字体大小自动缩放
+ (void)drawStringInRect:(BOOL)isautosize str:(NSString *)str rect:(CGRect)rect alignment:(NSTextAlignment)alignment clr:(UIColor *)clr;
+ (void)drawStringInRect:(NSString *)str rect:(CGRect)rect font:(UIFont *)font alignment:(NSTextAlignment)alignment clr:(UIColor *)clr;

// 在一个矩形范围内绘制字符串，可指定字体大小和是否垂直剧中
+ (void)drawStringInRect2:(BOOL)isbold fontsize:(int)fontsize isvercenter:(BOOL)isvercenter str:(NSString *)str rect:(CGRect)rect alignment:(NSTextAlignment)alignment clr:(UIColor *)clr;
+ (void)drawStringInRectEx:(BOOL)isbold fontsize:(int)fontsize isvercenter:(BOOL)isvercenter str:(NSString *)str rect:(CGRect)rect alignment:(NSTextAlignment)alignment breakmode:(NSLineBreakMode)brakmode clr:(UIColor *)clr;

// 在一个矩形范围内清除所有描画痕迹
+ (void)clearRect:(CGRect)rect;

// 填充一个多边形
+ (void)fillPolygon:(CGContextRef)gc pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr;
+ (void)fillPolygonInRect:(CGContextRef)gc rt:(CGRect)rt pts:(CGPoint *)pts count:(int)count clr:(UIColor *)clr;

// 渐变填充矩形
+ (void)buildCGGradientColors:(UIColor **)colors clrNum:(NSInteger)clrNum colorComponents:(CGFloat *)colorComponents;
+ (void)fillGradientRect:(CGContextRef)gc rt:(CGRect)rt colors:(UIColor **)colors clrNum:(NSInteger)clrNum;

// 填充不规则区域
+ (void)fillGradientPolygon:(CGContextRef)gc rt:(CGRect)rt pts:(CGPoint *)pts count:(int)count colors:(UIColor **)colors clrNum:(NSInteger)clrNum;

// 绘制图片
+ (void)drawImage:(CGContextRef)gc rt:(CGRect)rt imgRef:(CGImageRef)imgRef alpha:(CGFloat)alpha;
+ (void)drawImage:(CGContextRef)gc rt:(CGRect)rt img:(UIImage*)img blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

// 针对英文时,数据不显示情况问题解决
+ (NSString*)getDspString:(NSString*)string font:(UIFont*)font dspRect:(CGRect)rect;
+ (CGSize)getDspStringSize:(NSString *)string font:(UIFont*)font;
+ (int)getCenterIndex:(NSString*)string font:(UIFont*)font;

// 获取资源图片
+ (UIImage *)getRetinaImageWithContentsOfFile:(NSString *)imagePath;
+ (UIImage *)getRetinaImage:(NSString *)resourceImage;
+ (UIImage *)getImageWithScaleFactor:(NSString *)resourceImage factor:(CGFloat)factor;
@end

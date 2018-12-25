//
//  SDWebImageVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/12/25.
//  Copyright © 2018 sylar. All rights reserved.
//

#import "SDWebImageVCTL.h"
#import "UIImageView+WebCache.h"

@interface SDWebImageVCTL ()

@property (nonatomic, weak) IBOutlet UIImageView *v1;

@end

@implementation SDWebImageVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *url = @"https://pic.36krcnd.com/201812/25062833/epzt78l4jlvl10mm!1200";
    url = @"https://apicdn.app.gtja.com/baishitong/ZXZX/fwb_images/定投策略池KV200.png";
//    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [_v1 sd_setImageWithURL:[NSURL URLWithString:url]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
}



@end

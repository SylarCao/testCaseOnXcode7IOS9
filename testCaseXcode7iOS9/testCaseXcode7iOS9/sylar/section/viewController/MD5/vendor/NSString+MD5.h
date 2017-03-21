//
//  NSString+MD5.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/3/17.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

- (NSString*) sha1;

-(NSString *) md5;  // 32位加密

- (NSString *) sha1_base64;

- (NSString *) md5_base64;

- (NSString *) base64;

@end

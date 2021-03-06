//
//  DPHelper.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/11/2.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DPHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import "AFNetworking.h"
#import "JSONKit.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DPHelper()

@property (nonatomic, strong) NSString *dpKey;
@property (nonatomic, strong) NSString *dpSecret;
@property (nonatomic, strong) NSString *dpUrl;
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) cbDPLocationDataBlock block;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DPHelper

+ (instancetype) share
{
    static DPHelper *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = [[DPHelper alloc] init];
    });
    return inst;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        _dpKey = @"2318186849";
        _dpSecret = @"0fb9f066d21f43dc92e6d2f123172eb7";
        _dpUrl = @"http://api.dianping.com/v1/business/find_businesses";
        _page = 0;
    }
    return self;
}

- (void) refreshDataWithLongitude:(CLLocationDegrees)longitude latitude:(CLLocationDegrees)latitude block:(cbDPLocationDataBlock)block
{
    _page = 1;  //  默认是1， 从第一页开始
    _block = block;
    [self requestLocationWithLongitude:longitude latitude:latitude];
}

- (void) requestLocationWithLongitude:(CLLocationDegrees)longitude latitude:(CLLocationDegrees)latitude
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:[NSString stringWithFormat:@"%f", longitude] forKey:@"longitude"];
    [dict setObject:[NSString stringWithFormat:@"%f", latitude] forKey:@"latitude"];
    [dict setObject:[NSString stringWithFormat:@"%ld", (long)_page] forKey:@"page"];
    [dict setObject:@"2" forKey:@"platform"];
    NSString *the_string = [self dictToString:dict];
    NSString *sha_string = [self shaDP:the_string];
    [dict setObject:sha_string forKey:@"sign"];
    // url
    NSString *url = [NSString stringWithFormat:@"%@?%@=%@", _dpUrl, @"appkey", _dpKey];
    NSArray *keys = [dict allKeys];
    for (NSString *each_key in keys)
    {
        NSString *value = [dict objectForKey:each_key];
        url = [url stringByAppendingFormat:@"&%@=%@", each_key, value];
    }
    NSLog(@"dp Url = %@", url);
//    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    
    
    // request
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (_block)
        {
            _block(YES, [responseObject JSONString]);
        }
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
        if (_block)
        {
            _block(NO, @"error");
        }
    }];

}






- (NSString *) dictToString:(NSDictionary *)dict
{
    NSArray *all_keys = dict.allKeys;
    NSArray *keys = [all_keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *s1 = (NSString *)obj1;
        NSString *s2 = (NSString *)obj2;
        NSComparisonResult rt = [s1 compare:s2];
        return rt;
    }];
    NSString *rt = _dpKey;
    NSInteger key_count = [keys count];
    for (int i=0; i<key_count; i++)
    {
        NSString *the_key = [keys objectAtIndex:i];
        NSString *the_value = [dict objectForKey:the_key];
        rt = [rt stringByAppendingFormat:@"%@%@", the_key, the_value];
    }
    rt  = [rt stringByAppendingString:_dpSecret];
    return rt;
}

- (NSString *) shaDP:(NSString *)input
{
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    NSData *stringBytes = [input dataUsingEncoding: NSUTF8StringEncoding];
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-w"
    if (CC_SHA1([stringBytes bytes], [stringBytes length], digest))
    {
        /* SHA-1 hash has been calculated and stored in 'digest'. */
        NSMutableString *digestString = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH];
        for (int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
            unsigned char aChar = digest[i];
            [digestString appendFormat:@"%02X", aChar];
        }
        return digestString;
    }
    else
    {
        return nil;
    }
//#pragma clang diagnostic pop
    
}

@end

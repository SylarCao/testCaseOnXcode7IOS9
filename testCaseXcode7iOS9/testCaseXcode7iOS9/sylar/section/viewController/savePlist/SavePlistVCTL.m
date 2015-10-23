//
//  SavePlistVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/15.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "SavePlistVCTL.h"
#import "JSONKit.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface SavePlistVCTL ()

@property (nonatomic, strong) NSString *localPath;

@property (nonatomic, strong) NSDictionary *dict1;

@property (nonatomic, strong) NSArray *arr1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SavePlistVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitialValue];
}

- (void) setInitialValue
{
    _localPath = [NSString stringWithFormat:@"%@/Documents/abc.plist", NSHomeDirectory()];
    
    _dict1 = @{@"key1": @"value1", @"key2":@[@"a1", @"a2", @"a3"]};
    
    NSMutableDictionary *dd = [[NSMutableDictionary alloc] init];
    for (int i=0; i<30; i++)
    {
        NSString *key = [NSString stringWithFormat:@"%d", i];
        NSString *value = [NSString stringWithFormat:@"%d", i*2];
        [dd setObject:value forKey:key];
    }
    _dict1 = dd;
    
    NSMutableArray *aa = [[ NSMutableArray alloc] init];
    for (int i=0; i<30; i++)
    {
        NSString* ss = [NSString stringWithFormat:@"abd%d", i];
        [aa addObject:ss];
    }
    _arr1 = aa;
}


- (IBAction)btn1:(id)sender
{
//    [self saveToLocal];
    [self saveArrayPlist];
}


- (IBAction)btn2:(id)sender
{
//    [self saveToLocal];
    
    [self readPlist];

}

- (void) bundlePlist
{
    
}

- (void) saveToLocal
{
    NSTimeInterval t1 = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"t1 = %f", t1);
    BOOL bb = [_dict1 writeToFile:_localPath atomically:YES];
    NSLog(@"bb = %d", bb);
    
    NSTimeInterval t2 = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"t1 = %f", t2);
    
    NSLog(@"delta = %f", t2-t1);
}

- (void) saveArrayPlist
{
    NSTimeInterval t1 = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"t1 = %f", t1);
    BOOL bb = [_arr1 writeToFile:_localPath atomically:YES];
    NSLog(@"bb = %d", bb);
    
    NSTimeInterval t2 = [NSDate timeIntervalSinceReferenceDate];
    NSLog(@"t1 = %f", t2);
    
    NSLog(@"delta = %f", t2-t1);
}

- (void) readPlist
{
    id aaa = [NSArray arrayWithContentsOfFile:_localPath];
    id bbb = [NSDictionary dictionaryWithContentsOfFile:_localPath];
    NSLog(@"aaa = %@ - %@", aaa, bbb);
}


@end

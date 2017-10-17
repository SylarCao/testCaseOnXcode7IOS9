//
//  BasicVCTL.m
//  testCase
//
//  Created by sylar on 15/9/21.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "BasicVCTL.h"
#import "MBProgressHUD.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
NSString * const kPlistPath = @"Documents/HomePlistViewcontroller.plist";  // 保存的路劲
NSTimeInterval const kSaveTime = 3600;  // 时间的间隔
NSInteger const kMaxSaveNumber = 50;
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface BasicVCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation BasicVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = NSStringFromClass([self class]);
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:nil action:nil];
    if ([self.title isEqualToString:@"HomeVCTL"] == NO) {
        [self savePlist: self.title];
    }
}

- (void) showHudWithContent:(NSString *)content {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = content;
    hud.margin = 20;
    [hud hide:YES afterDelay:1];
}

#pragma mark - save plist

- (void)savePlist:(NSString *)name {
    NSString *path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), kPlistPath];
    NSTimeInterval time0 = [NSDate timeIntervalSinceReferenceDate];
    NSDictionary *dict = @{@"time": [NSString stringWithFormat:@"%f", time0], @"name": name};
    
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    if (arr == nil) {
        arr = [NSMutableArray arrayWithObject:dict];
    } else {
        [arr insertObject:dict atIndex:0];
    }
    [arr writeToFile:path atomically:YES];
}

+ (NSMutableArray *)getPlistArray {
    NSMutableArray *rt = [NSMutableArray array];
    NSString *path = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(), kPlistPath];
    NSTimeInterval time0 = [NSDate timeIntervalSinceReferenceDate];
    NSMutableArray *arr = [NSMutableArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in arr) {
        NSTimeInterval time = [[dict objectForKey:@"time"] floatValue];
        if (time0 - time < kSaveTime) {
            NSString *name = [dict objectForKey:@"name"];
            if ([rt containsObject:name] == NO && rt.count < 3) {
                [rt addObject:name];
            }
        }
    }
    if (arr.count > kMaxSaveNumber) {
        [arr removeAllObjects];
        for (NSString *name in rt) {
            NSDictionary *dict = @{@"name": name, @"time": [NSString stringWithFormat:@"%f", time0]};
            [arr addObject:dict];
        }
        BOOL bb = [arr writeToFile:path atomically:YES];
        NSLog(@"save plist success = %d", bb);
    }
    return rt;
}

@end

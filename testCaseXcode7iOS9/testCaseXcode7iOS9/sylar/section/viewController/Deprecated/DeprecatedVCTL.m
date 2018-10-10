//
//  DeprecatedVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/9/20.
//  Copyright © 2018年 sylar. All rights reserved.
//

#import "DeprecatedVCTL.h"
#import "DeprecatedObject1.h"

@interface DeprecatedVCTL () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *table;

@end

@implementation DeprecatedVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fun1];
    
    _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _table.dataSource = self;
    _table.delegate = self;
}

- (void)fun1 {
    DeprecatedObject1 *aa = [[DeprecatedObject1 alloc] init];
//    [aa fun1];   // 会有warning
    [aa fun2];
}

- (void)fun2 {
    
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *aa = nil;
    return aa;
}

@end

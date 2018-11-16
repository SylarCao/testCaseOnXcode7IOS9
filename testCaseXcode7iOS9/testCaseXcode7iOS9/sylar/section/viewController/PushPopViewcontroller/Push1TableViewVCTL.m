//
//  Push1TableViewVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/11/16.
//  Copyright © 2018 sylar. All rights reserved.
//

#import "Push1TableViewVCTL.h"
#import "Push2CodeVCTL.h"
#import "Push3CodeVCTL.h"

@interface Push1TableViewVCTL () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *table;

@end

@implementation Push1TableViewVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.title = NSStringFromClass([self class]);
    
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section + 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *rt = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    rt.textLabel.text = [NSString stringWithFormat:@"aa = %ld - %ld", indexPath.section, indexPath.row];
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"sylar : did select = %ld - %ld", indexPath.section, indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        [self fun1];
    } else if (indexPath.section == 2) {
        [self fun2];
    } else if (indexPath.section == 3) {
        [self fun3];
    }
}

#pragma mark - add child VCTL

- (void)fun3 {
    
}

- (void)fun2 {
//    Push2CodeVCTL *p2 = [[Push2CodeVCTL alloc] initWithNibName:nil bundle:nil];
//    [self.view addSubview:p2.view];
    
    Push3CodeVCTL *p3 = [[Push3CodeVCTL alloc] initWithNibName:nil bundle:nil];
    [self addChildViewController:p3];
    p3.view.frame = CGRectMake(100, 150, kScreenWidth-120, 200);
    [self.view addSubview:p3.view];
    [p3 didMoveToParentViewController:self];
}

- (void)fun1 {
    Push2CodeVCTL *p2 = [[Push2CodeVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:p2 animated:YES];
}

@end

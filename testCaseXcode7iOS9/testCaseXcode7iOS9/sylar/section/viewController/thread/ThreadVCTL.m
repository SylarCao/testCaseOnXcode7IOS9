//
//  ThreadVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/1/6.
//  Copyright © 2017年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ThreadVCTL.h"
#import "ThreadMethod1.h"
#import "ThreadMain1.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ThreadVCTL ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ThreadMethod1 *m1;

@property (nonatomic, weak) IBOutlet UITableView *table;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ThreadVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // table view
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (IBAction)btn1:(id)sender {
    
//    [self fun1];
    
    [self fun2];
    
}

- (void)fun1 {
    ThreadMethod1 *m1 = [[ThreadMethod1 alloc] init];
    _m1 = m1;
    [m1 method1];
    
}

- (void)fun2 {
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_table reloadData];
//    });
    
//    [_table reloadData];
    
    [[ThreadMain1 share] fun1];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_table reloadData];
    });
    
//
//    [_table reloadData];
}


#pragma mark - UITableViewDelegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"sylar :  numberOfRowsInSection");
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *rt = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    rt.textLabel.text = [NSString stringWithFormat:@"index = %ld", indexPath.row];
    return rt;
    
}


@end

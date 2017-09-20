//
//  PopPreviousVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2017/9/20.
//  Copyright © 2017年 sylar. All rights reserved.
//

#import "PopPreviousVCTL.h"

@interface PopPreviousVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *label;

@end

@implementation PopPreviousVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_value > 0) {
        _label.text = [NSString stringWithFormat:@"a = %ld", _value];
    }
    
}

- (IBAction)btn1Action:(id)sender {
    PopPreviousVCTL *pp = [[PopPreviousVCTL alloc] initWithNibName:nil bundle:nil];
    pp.value = _value + 1;
    [self.navigationController pushViewController:pp animated:YES];
}

- (IBAction)btn2Action:(id)sender {
    [self fun2];
    
}

- (void)fun2 {
    // 把之前的remove掉
    NSLog(@"sylar :  remove fun2");
    NSArray *a1 = self.navigationController.viewControllers;
    NSMutableArray *m1 = [a1 mutableCopy];
    [m1 removeObjectAtIndex:a1.count-1-1];
    self.navigationController.viewControllers = m1;
}

- (void)fun1 {
    // push 的时候把当前这个remove掉
    NSArray *a1 = self.navigationController.viewControllers;
    NSMutableArray *m1 = [a1 mutableCopy];
    [m1 removeLastObject];
    PopPreviousVCTL *pp = [[PopPreviousVCTL alloc] initWithNibName:nil bundle:nil];
    [m1 addObject:pp];
    pp.value = _value + 1;
    [self.navigationController setViewControllers:m1.copy animated:YES];
}

@end

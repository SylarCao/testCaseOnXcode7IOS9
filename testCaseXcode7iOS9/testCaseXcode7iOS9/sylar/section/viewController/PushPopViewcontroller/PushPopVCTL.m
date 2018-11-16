//
//  PushPopVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/7/11.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PushPopVCTL.h"
#import "Push1TableViewVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PushPopVCTL ()


@property (nonatomic, weak) IBOutlet UILabel *content;

@property (nonatomic, assign) NSInteger index;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PushPopVCTL
- (void)dealloc
{
    NSLog(@"dealloc = %ld", _index);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    static NSInteger i = 1;
    _content.text = [NSString stringWithFormat:@"index = %ld", i++];
    NSLog(@"did load = %ld", i);
    _index = i;
}

- (IBAction)btnChild:(id)sender {
    Push1TableViewVCTL *aa = [[Push1TableViewVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:aa animated:YES];
}

- (IBAction)btnPush:(id)sender
{
    PushPopVCTL *v = [[PushPopVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)btnPopRootPush:(id)sender
{
    NSArray *vv = [self.navigationController viewControllers];
    UIViewController *v1 = [vv objectAtIndex:0];
    [self.navigationController popToViewController:v1 animated:NO];
    PushPopVCTL *v = [[PushPopVCTL alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:v animated:YES];
    
    [v1.navigationController pushViewController:v animated:YES];
}




@end

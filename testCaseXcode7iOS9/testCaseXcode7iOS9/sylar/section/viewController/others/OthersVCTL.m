//
//  OthersVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/3/30.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "OthersVCTL.h"
#import "OthersInstance.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface OthersVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *content1;


@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation OthersVCTL

- (void)dealloc
{
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setInitialValue];
    
//    id dd = [OthersInstance share];
}



- (void)setInitialValue
{
    static NSInteger i=1;
    _content1.text = [NSString stringWithFormat:@"content = %ld", i++];
    
    [self fun1];
}

- (void)fun1
{
    //  吧自己这个viewController放到一个array里，看看pop的时候会不会release
    
    [[OthersInstance share] addVCTL:self];
    
}

- (IBAction)btn1:(id)sender
{
    OthersVCTL *v1 = [[OthersVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:v1 animated:YES];
}

@end

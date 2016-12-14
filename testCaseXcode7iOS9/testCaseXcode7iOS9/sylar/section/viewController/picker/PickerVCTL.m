//
//  PickerVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/15.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PickerVCTL.h"
#import "PickerViewController.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PickerVCTL ()
<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *data;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PickerVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = @[@"111", @"222", @"111", @"333", @"111", @"444", @"111", @"555",];
}

- (void)fun1
{
    // 模拟器用100%的看
    CGSize size = self.view.frame.size;
    NSInteger height = 250;
    UIPickerView *pp = [[UIPickerView alloc] initWithFrame:CGRectMake(0, size.height-height, size.width-40, height)];
    pp.delegate = self;
    pp.dataSource  = self;
    [self.view addSubview:pp];
    pp.showsSelectionIndicator = YES;
    pp.layer.borderColor = [UIColor redColor].CGColor;
    pp.layer.borderWidth = 1;
    
    pp.backgroundColor = [UIColor whiteColor];
    
}



- (IBAction)btn1:(id)sender
{
    [self fun1];
}

-(IBAction)btn2:(id)sender
{
    PickerViewController *pp = [[PickerViewController alloc] initWithNibName:nil bundle:nil];
    pp.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:pp animated:YES completion:^{
    }];
}




#pragma mark - UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger rt = [_data count];
    return rt;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *rt = [_data objectAtIndex:row];
    return rt;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"did select row = %ld, component = %ld", row, component);
}





@end

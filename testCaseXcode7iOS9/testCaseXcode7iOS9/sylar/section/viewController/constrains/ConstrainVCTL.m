//
//  ConstrainVCTL.m
//  testCase
//
//  Created by sylar on 15/9/22.
//  Copyright (c) 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ConstrainVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ConstrainVCTL ()

@property (nonatomic, strong) UIView *v1;
@property (nonatomic, strong) UIView *v2;

@property (nonatomic, strong) UIPageControl *p1;

@property (nonatomic, assign) NSInteger height1;
@property (nonatomic, assign) NSInteger width1;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constrainValue1;
@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ConstrainVCTL

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self fun2];
    
//    [self addV1V2];
    
//    _height1 = 50;
//    _width1 = 50;
//    [self constraints4];
}

- (void)fun2 {
    UILabel *ll = [[UILabel alloc] initWithFrame:CGRectZero];
    ll.translatesAutoresizingMaskIntoConstraints = NO;
    ll.text = @"My Label";
    ll.font = [UIFont systemFontOfSize:20];
    ll.textColor = [UIColor redColor];
    [self.view addSubview:ll];
    
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:ll
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:100];
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:ll
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1
                                                           constant:0];
    
    [self.view addConstraints:@[c1, c2]];
}


- (void) addV1V2
{
    _v1 = [[UIView alloc] initWithFrame:CGRectMake(20, 120, 100, 100)];
    _v1.backgroundColor = [UIColor redColor];
    _v1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_v1];
    
    _v2 = [[UIView alloc] initWithFrame:CGRectMake(20, 120, 40, 40)];
    _v2.backgroundColor = [UIColor yellowColor];
    _v2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_v2];
    
    _p1 = [[UIPageControl alloc] init];
    _p1.translatesAutoresizingMaskIntoConstraints = NO;
    _p1.backgroundColor = [UIColor blueColor];
    _p1.numberOfPages = 3;
    [self.view addSubview:_p1];
}

- (IBAction)btn1:(id)sender
{
    NSArray *cc = self.view.constraints;
    NSLayoutConstraint *the_one = nil;
    for (NSLayoutConstraint *each_constraint in cc)
    {
        if (each_constraint.firstItem == _v2 && each_constraint.secondItem == nil)
        {
            the_one = each_constraint;
            break;
        }
    }
    
    NSLog(@"cc = %@", the_one);
    the_one.constant = 90;
}

- (void)constraints4
{
    NSDictionary *dict = NSDictionaryOfVariableBindings(_v1, _v2);
    
    NSInteger var1 = _width1;
    
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_v1]-10-[_v2(==37)]-10-|" options:0 metrics:nil views:dict];
    
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-300-[_v1]-20-|" options:0 metrics:nil views:dict];
    NSArray *c3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-300-[_v2]-20-|" options:0 metrics:nil views:dict];
    
    [self.view addConstraints:c1];
    [self.view addConstraints:c2];
    [self.view addConstraints:c3];
    

}

- (void) constraints3
{
    
//    // center _p1 horizontally in self.view
//    self.view.addConstraint(NSLayoutConstraint(item: _p1, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0));
//
//    // center _p1 vertically in self.view
//    self.view.addConstraint(NSLayoutConstraint(item: _p1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0));
    
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:_p1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:_p1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraints:@[c1, c2]];
    
}

- (void) constraints2
{
    NSDictionary *dict = NSDictionaryOfVariableBindings(_v1, _v2);
    NSArray *c1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_v1(==200)]-(>=40)-|" options:0 metrics:nil views:dict];
    
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_v1]-40-|" options:0 metrics:nil views:dict];

    
    [self.view addConstraints:c1];
    [self.view addConstraints:c2];
    
}

- (void) constraints1
{
//    NSLayoutConstraint *centreHorizontallyConstraint = [NSLayoutConstraint constraintsWithVisualFormat:<#(NSString *)#> options:<#(NSLayoutFormatOptions)#> metrics:<#(NSDictionary *)#> views:<#(NSDictionary *)#>
//    [self.view addConstraint:centreHorizontallyConstraint];
    
//    [self.view addConstraints:[NSLayoutConstraint
//                               constraintsWithVisualFormat:@"V:|-[_v1(>=748)]-|"
//                               options:NSLayoutFormatDirectionLeadingToTrailing
//                               metrics:nil
//                               views:NSDictionaryOfVariableBindings(_v1)]];
    
//    [self.view addConstraints:[NSLayoutConstraint
//                               constraintsWithVisualFormat:@"H:[_v1(==200)]-|"
//                               options:NSLayoutFormatDirectionLeadingToTrailing
//                               metrics:nil
//                               views:NSDictionaryOfVariableBindings(_v1)]];
    
    
    
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:_v1
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1
                                                           constant:20];
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:_v1
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1
                                                           constant:20];
    NSLayoutConstraint *c3 = [NSLayoutConstraint constraintWithItem:_v1
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1
                                                           constant:20];
    NSLayoutConstraint *c4 = [NSLayoutConstraint constraintWithItem:_v1
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1
                                                           constant:-20];
    [self.view addConstraints:@[c1, c2, c3, c4]];
    
    
}


@end

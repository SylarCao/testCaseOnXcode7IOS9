//
//  AttributeStringVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/22.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "AttributeStringVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface AttributeStringVCTL ()

@property (nonatomic, weak) IBOutlet UILabel *lb1;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation AttributeStringVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lb1.layer.borderColor = [UIColor redColor].CGColor;
    _lb1.layer.borderWidth = 1;
    
    [self setInitialValue];
}

- (void) setInitialValue
{
//    [self setWithLabel1];
//    [self setWithLabel2];
    
//    [self fun1];
    
    [self fun2];
    
    
}

- (void)fun2
{
    // 文字 外边加个框  html
    NSMutableAttributedString *m1 = [[NSMutableAttributedString alloc] initWithString:@"text123" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    NSMutableAttributedString *m2 = [[NSMutableAttributedString alloc] initWithString:@"融资" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    
    NSString *h5 = @"<p style=\" background-color: red;\"> html5 </h5>";
    
//    NSString *h5 = @"<p style=\"border: solid red 2px;\"> html5 </h5>";  // 这个 不可以用
    
    NSAttributedString *m3 =[[NSAttributedString alloc] initWithData:[h5 dataUsingEncoding:NSUTF8StringEncoding]
                                     options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                               NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)}
                          documentAttributes:nil error:nil];
    [m1 appendAttributedString:m3];
    
    _lb1.attributedText = m1;
}

- (void)fun1
{
    // 文字 + 图片
    NSMutableAttributedString *m1 = [[NSMutableAttributedString alloc] initWithString:@"text123" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    UIImage *image58 = [UIImage imageNamed:@"sgs7"];
    image58 = [[Helper share] imageScaleFitToSize:CGSizeMake(40, 40) image:image58];
    textAttachment.image = image58;
    NSAttributedString *m2 = [NSAttributedString attributedStringWithAttachment:textAttachment];
//    NSMutableAttributedString *m2 = [[NSMutableAttributedString alloc] ]
//    [m1 appendAttributedString:m2];
    
//    NSMutableAttributedString *m3 = [[NSMutableAttributedString alloc] initWithString:@"text123" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
//    [m1 appendAttributedString:m3];
    
    _lb1.attributedText = m1;
    
    
    
}



- (void) setWithLabel1
{
    UILabel *lb = [[UILabel alloc] init];
    lb.layer.borderWidth = 1;
    lb.layer.borderColor = [UIColor blackColor].CGColor;
    
    lb.frame = CGRectMake(50, 80, 200, 50);
    
    NSAttributedString *attr1 = [[NSAttributedString alloc] initWithString:@"this is label 1" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    lb.attributedText = attr1;
    [self.view addSubview:lb];
}

- (void) setWithLabel2
{
    UILabel *lb = [[UILabel alloc] init];
    lb.layer.borderWidth = 1;
    lb.layer.borderColor = [UIColor blackColor].CGColor;
    lb.numberOfLines = 0;
    lb.frame = CGRectMake(50, 140, 200, 50);
    lb.backgroundColor = [UIColor greenColor];
    lb.textAlignment = NSTextAlignmentCenter;
    
    NSMutableAttributedString *muta_string = [[NSMutableAttributedString alloc] initWithString:@"line2 -- end" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"line1 \n" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    [muta_string insertAttributedString:str1 atIndex:0];
    
    lb.attributedText = muta_string;
    [self.view addSubview:lb];
    
}

+ (UILabel *) getOneLabel
{
    UILabel *lb = [[UILabel alloc] init];
    lb.numberOfLines = 0;
    //    lb.frame = CGRectMake(50, 140, 200, 50);
    lb.backgroundColor = [UIColor greenColor];
    
    NSMutableAttributedString *muta_string = [[NSMutableAttributedString alloc] initWithString:@"line2 -- end" attributes:@{NSForegroundColorAttributeName: [UIColor yellowColor]}];
    NSAttributedString *str1 = [[NSAttributedString alloc] initWithString:@"line1 \n" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    [muta_string insertAttributedString:str1 atIndex:0];
    
    lb.attributedText = muta_string;
    return lb;
}


@end



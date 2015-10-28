//
//  ReadPDFVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/10/28.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "ReadPDFVCTL.h"
#import "ReadPDFDefaultVCTL.h"
#import <QuickLook/QuickLook.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ReadPDFVCTL ()
<QLPreviewControllerDelegate, QLPreviewControllerDataSource>

@property (nonatomic, strong) UIDocumentInteractionController *docInteractionController;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation ReadPDFVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    QLPreviewController *ql = [[QLPreviewController alloc] init];
    ql.delegate = self;
    ql.dataSource = self;
    ql.currentPreviewItemIndex = 1;
    [self.navigationController pushViewController:ql animated:YES];
}


#pragma mark - QLPreviewControllerDelegate
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 3;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    NSString *file_name = [NSString stringWithFormat:@"file_pdf%d", (int)(index+1)];
//    id aa = [NSBundle pathForResource:file_name ofType:@"pdf" inDirectory:@"pdf"];
    NSString *path = [[NSBundle mainBundle] pathForResource:file_name ofType:@"pdf"];
    NSURL *rt = [NSURL fileURLWithPath:path];
//    [self setupDocumentControllerWithURL:rt];
//    rt = [NSURL fileURLWithPath:@"pp1.pdf"];
//    NSLog(@"bb = %@", aa);
//    rt = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pp1.pdf" ofType:nil]];
    return rt;
}

-(CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id<QLPreviewItem>)item inSourceView:(UIView *__autoreleasing *)view
{
    //提供变焦的开始rect，扩展到全屏
    return CGRectMake(110, 190, 100, 100);
}


@end

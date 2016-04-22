//
//  EWMCodeVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/21.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "EWMCodeVCTL.h"
#import <AVFoundation/AVFoundation.h>
#import "RQScanVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface EWMCodeVCTL ()
<AVCaptureMetadataOutputObjectsDelegate>

// 扫二维码用的
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UIView *viewPreview;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation EWMCodeVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (kIsSimulator)
    {
        UILabel *lb = [[UILabel alloc] init];
        lb.text = @"不要用模拟器";
        lb.frame = CGRectMake(0, 0, 300, 300);
        lb.backgroundColor = [UIColor redColor];
        [self.view addSubview:lb];
    }
    else
    {
        [self funScan];
        [self loadBeepSound];
    }
    
    
}

- (IBAction)btn1:(id)sender
{
//    [self funScan];
    
//    [self funScan];
//    [self loadBeepSound];
    
     [_captureSession startRunning];
}

- (IBAction)btn2:(id)sender
{
    RQScanVCTL *rr = [[RQScanVCTL alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:rr animated:YES];
}

- (IBAction)btn3:(id)sender
{
    [self funCreateCode];
}

- (void)funCreateCode
{
    NSString *content = @"abcdefgh765432";
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *outputImage = filter.outputImage;
    
    CGFloat scale = CGRectGetWidth(_viewPreview.bounds) / CGRectGetWidth(outputImage.extent);
    CGAffineTransform transform = CGAffineTransformMakeScale(scale, scale);
    CIImage *transformImage = [outputImage imageByApplyingTransform:transform];
    
    UIImage *im = [UIImage imageWithCIImage:transformImage];
    UIImageView *imv = [[UIImageView alloc] initWithImage:im];
    imv.frame = _viewPreview.bounds;
    [_viewPreview addSubview:imv];
}

- (void)funScan
{
    // reference link: http://www.appcoda.com/qr-code-ios-programming-tutorial/
    // full screen 扫码范围 https://github.com/c0ming/QRCodeDemo
    
    NSError *error;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (!input) {
        NSLog(@"%@", [error localizedDescription]);
        return ;
    }
    
    _captureSession = [[AVCaptureSession alloc] init];
    [_captureSession addInput:input];
    
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_viewPreview.layer.bounds];
    [_viewPreview.layer addSublayer:_videoPreviewLayer];
    
//    [_captureSession startRunning];
    

}

- (void)funImage
{
    
}



#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            
            NSLog(@"aaa = %@", metadataObj.stringValue);
            
            [self stopReading];
            
            
            
            [_audioPlayer play];
            
//            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
//            
//            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
//            [_bbitemStart performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
//            _isReading = NO;
            
//            [self performSelectorOnMainThread:@selector(backItem) withObject:nil waitUntilDone:YES];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
            
        }
    }
}

- (void)backItem
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)stopReading{
    [_captureSession stopRunning];
    _captureSession = nil;
    
    [_videoPreviewLayer removeFromSuperlayer];
}

-(void)loadBeepSound{
    NSString *beepFilePath = [[NSBundle mainBundle] pathForResource:@"beep_mine" ofType:@"mp3"];
    NSURL *beepURL = [NSURL URLWithString:beepFilePath];
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:beepURL error:&error];
    if (error) {
        NSLog(@"Could not play beep file.");
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        [_audioPlayer prepareToPlay];
    }
}



@end

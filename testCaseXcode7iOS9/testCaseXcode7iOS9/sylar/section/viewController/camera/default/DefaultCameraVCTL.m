//
//  DefaultCameraVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/21.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "DefaultCameraVCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface DefaultCameraVCTL ()
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation DefaultCameraVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    kReturnCondition(kIsSimulator, @"不要用模拟器");
    
    [self funTakePhoto];
}

- (IBAction)btn2:(id)sender
{
    kReturnCondition(kIsSimulator, @"不要用模拟器");
    
    [self funPhotoAlbum];
}


- (void)funTakePhoto
{
    UIImagePickerController *pp = [[UIImagePickerController alloc] init];
    pp.delegate = self;
    pp.allowsEditing = YES;
    pp.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:pp animated:YES completion:nil];
}

- (void)funPhotoAlbum
{
    UIImagePickerController *pp = [[UIImagePickerController alloc] init];
    pp.delegate = self;
    pp.allowsEditing = YES;
    pp.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pp animated:YES completion:nil];
}



#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"");
    UIImage *image = [info objectForKey: UIImagePickerControllerEditedImage];
    _imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"cancel");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  PlayVideoVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/6/30.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "PlayVideoVCTL.h"
#import <MediaPlayer/MediaPlayer.h>
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface PlayVideoVCTL ()

@property (nonatomic, weak) IBOutlet UIView *videoBkgView;

@property (nonatomic, strong) MPMoviePlayerViewController *mm;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation PlayVideoVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btn1:(id)sender
{
    [self fun1];
}

- (IBAction)btn2:(id)sender
{
    
}

- (void)fun1
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"video1" ofType:@"mp4"];
    
    if (path)
    {
        MPMoviePlayerViewController *theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
        _mm = theMovie;
        theMovie.view.frame = _videoBkgView.bounds;
        theMovie.moviePlayer.scalingMode = MPMovieScalingModeAspectFit;
        theMovie.moviePlayer.controlStyle = MPMovieControlStyleNone;
        theMovie.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        theMovie.moviePlayer.fullscreen = NO;
        
        [_videoBkgView addSubview:theMovie.view];
        
    }
}

- (void)fun2
{
    [_mm.moviePlayer play];
}

@end

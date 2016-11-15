//
//  GJBaseView.m
//  YYZPlus
//
//  Created by 梧桐 on 16/6/1.
//
//

#import "GJBaseView.h"

@implementation GJBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self setBackgroundColor:kViewBgColor];
        
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(vcMsgThemeChange:) name:kThemeChangeNotification object:nil];
        [self setClearsContextBeforeDrawing:YES];
    }
    return self;
}

- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeChangeNotification object:nil];
}

- (void)vcMsgThemeChange:(NSNotification *)notification {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

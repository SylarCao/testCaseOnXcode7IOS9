//
//  SwizzlerVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2018/11/8.
//  Copyright © 2018 sylar. All rights reserved.
//

#import "SwizzlerVCTL.h"
#import "SSButton.h"
#import "UIButton+Swizzle.h"
#import <objc/runtime.h>

@interface SwizzlerVCTL ()

@end

@implementation SwizzlerVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [b1 addTarget:self action:@selector(fun1) forControlEvents:UIControlEventTouchUpInside];
    [b1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    b1.frame = CGRectMake(33, 100, 50, 50);
    [b1 setTitle:@"t1" forState:UIControlStateNormal];
    [self.view addSubview:b1];
    b1.layer.borderColor = [UIColor redColor].CGColor;
    b1.layer.borderWidth = 1;
}

- (IBAction)btn1Action:(id)sender {
    NSLog(@"sylar : 11");
    
    [self swizzleButton];
}

- (void)fun1 {
    NSLog(@"sylar : fun1");
    
    SSButton *s = [[SSButton alloc] init];
    [self.view addSubview:s];
}

- (void)swizzleButton {
//    simple_Swizzle([SSButton class], @selector(didMoveToWindow), @selector(sfun1));
//    best_Swizzle([SSButton class], @selector(didMoveToWindow), @selector(sfun1));
    
//    simple_Swizzle([UIButton class], @selector(didMoveToWindow), @selector(swFun1));  // uibutton
//    best_Swizzle([UIButton class], @selector(didMoveToWindow), @selector(swFun1));
    
    [self bestSwizzleClass:[UIButton class] originalSel:@selector(didMoveToWindow) swizzleSel:@selector(swFun1)];
}



- (BOOL)simpleSwizzleClass:(Class)aClass originalSel:(SEL)originalSel swizzleSel:(SEL)swizzleSel {
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    method_exchangeImplementations(originalMethod, swizzleMethod);
    return YES;
}

- (BOOL)bestSwizzleClass:(Class)aClass originalSel:(SEL)originalSel swizzleSel:(SEL)swizzleSel {
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    BOOL didAddMethod = class_addMethod(aClass, originalSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    
    return YES;
}

BOOL simple_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel){

    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    method_exchangeImplementations(originalMethod, swizzleMethod);

    return YES;
}

BOOL best_Swizzle(Class aClass, SEL originalSel,SEL swizzleSel){
    
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    BOOL didAddMethod = class_addMethod(aClass, originalSel, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod));
    if (didAddMethod) {
        class_replaceMethod(aClass, swizzleSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzleMethod);
    }
    
    return YES;
}

@end

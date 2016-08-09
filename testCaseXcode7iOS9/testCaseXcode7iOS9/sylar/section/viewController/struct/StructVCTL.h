//
//  StructVCTL.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/8/9.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef struct DHZ_DATAHEAD_t
{
    char	tag;
    short	type;
    short 	attrs;
    unsigned short	length;
}DZH_DATAHEAD;

@interface StructVCTL : BasicVCTL

@end

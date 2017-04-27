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


typedef struct ss1
{
    short v1;
}ss1;


typedef struct ss2
{
    short v1;
    char v2;
}ss2;

typedef struct ss3
{
    short v1;
    char v2;
    int v3;
}ss3;

typedef struct ss4
{
//    short v1;
    char v2;
    int v3;
}ss4;


typedef struct ss5
{
    short v1;
    char v2;
    char v3;
    char v4;
    int v5;
}ss5;

typedef struct ss6
{
    char v2;
    int v3;
    short v1;
}ss6;

struct SX
{
    short s; /* 2 bytes */
             /* 2 padding bytes */
    int   i; /* 4 bytes */
    char  c; /* 1 byte */
             /* 3 padding bytes */
}SX;

struct SY
{
    int   i; /* 4 bytes */
    char  c; /* 1 byte */
             /* 1 padding byte */
    short s; /* 2 bytes */
}SY;

struct SZ
{
    int   i; /* 4 bytes */
    short s; /* 2 bytes */
    char  c; /* 1 byte */
             /* 1 padding byte */
}SZ;

struct SA {
    int  a1; /* 4 bytes */
    char a2; /* 1 byte  + 3 padding bytes */
    int  a3; /* 4 bytes */
    char a4; /* 1 byte  + 3 padding bytes */
}SA;

struct SB {
    char  a1; /* 1 bytes + 1 padding bytes*/
    short a2; /* 2 byte */
    int  a3;  /* 4 bytes */
}SB;

struct SC {
    char  a1;    // 1 bytes + 1 padding bytes   = 2
    short a2;    // 2 byte                      = 2
    int  a3;     // 4 bytes                     = 4
    char a4[9];  // 9 bytes + 3 padding bytes   = 10
}SC;

struct SC1 {   // size  = 20
    char  a1;    // 1 bytes + 1 padding bytes   = 2
    short a2;    // 2 byte                      = 2
    int  a3;     // 4 bytes                     = 4
    char a4[9];  // 9 bytes + 1 padding bytes   = 10
    short a5;    // 2 byte                      = 2
}SC1;

struct SC2 {   // size  = 24
    char  a1;    // 1 bytes + 1 padding bytes   = 2
    short a2;    // 2 byte                      = 2
    int  a3;     // 4 bytes                     = 4
    char a4[9];  // 9 bytes + 1 padding bytes   = 10
    short a5;    // 2 byte                      = 2
    char  a6;     // 1 byte + 3 padding          = 4
}SC2;

struct SC3 {   // size  = 20
    char  a1;    // 1 bytes + 1 padding bytes   = 2
    short a2;    // 2 byte                      = 2
    int  a3;     // 4 bytes                     = 4
    char a4[9];  // 9 bytes                     = 9
    char  a5;     // 1 byte                      = 1
    short a6;    // 2 byte                      = 2
    
}SC3;


@interface StructVCTL : BasicVCTL

@end

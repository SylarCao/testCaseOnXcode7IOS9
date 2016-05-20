//
//  CPlus.cpp
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/4/12.
//  Copyright © 2016年 sylar. All rights reserved.
//

#include "CPlus.hpp"




void cppClass1::cppFun4()
{
    string data = "34";
    
    
    char *pdata = (char *)data.c_str();
    
    printf("val = %d", *pdata);
    
    int a = 0;
    
    int *pos = &a;
    
    int val     = 0;
    char *ptr   = pdata + *pos;
    *pos        += sizeof(char);
    val         = (*ptr - '0' + 48);    // '0' ASCII 代表10进制数 48
    
    printf("val = %d, %c", val, *ptr);
}

void cppClass1::cppFun3()
{
    char ch1 = '0';
    int a = ch1;
    printf("a = %d", a);
}


void cppClass1::cppFun1()
{
    string s1 = "s1";
    string s2 = "s2";
    string s3 = s1 + s2;
    printf("s1 = %s \n s2 = %s \n", s1.c_str(), s2.c_str());
    printf("s3 = %s  \n", s3.c_str());
    
    cppFun2(23, "abd");
}

void cppClass1::cppFun2(int int1, string string1)
{
    int1 = int1 + 20;
    printf("int1 = %d  \n", int1);
    
    string1 = string1 + "END";
    
    printf("string = %s", string1.c_str());
    
}








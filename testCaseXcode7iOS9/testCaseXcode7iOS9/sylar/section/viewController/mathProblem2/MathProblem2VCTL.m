//
//  MathProblem2VCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 15/12/14.
//  Copyright © 2015年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "MathProblem2VCTL.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MathProblem2VCTL ()

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MathProblem2VCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self roundFunction1];
    
//    [self fun2];
    
    [self fun3];
}

- (void)roundFunction1
{
    NSInteger a1 = round(3.3);  // 3
    NSInteger a2 = round(3.5);  // 4
    NSInteger a3 = round(3.0);  // 3
    NSInteger a4 = round(2.9);  // 3
    
    NSLog(@"a123 = %ld, %ld, %ld %ld", a1, a2, a3, a4);
}

- (void)fun2
{
    CGFloat f1 = 3.4;
    CGFloat f2 = 3;
    CGFloat f3 = 3.0;
    
    NSInteger a1 = ceilf(f1);  // 4
    NSInteger a2 = ceilf(f2);  // 3
    NSInteger a3 = ceilf(f3);  // 3
    
    CGFloat d1 = ceilf(f1);  // 4.0000
    CGFloat d2 = ceilf(f2);  // 3.0000
    CGFloat d3 = ceilf(f3);  // 3.0000
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
#pragma clang diagnostic ignored "-Wformat"
    NSLog(@"a123 = %d, %d, %d", a1, a2, a3);
    NSLog(@"d123 = %f, %f, %f", d1, d2, d3);
#pragma clang diagnostic pop
    
}

- (void)fun3 {
    // 整理excel的数据
    NSString *s1 = @"12.11    12.11    12.11    12.11    12.11    12.12    12.12    12.12    12.12    12.12    12.13    12.13    12.13    12.13    12.13    12.14    12.14    12.14    12.14    12.14    12.15    12.15    12.15    12.15    12.15    12.18    12.18    12.18    12.18    12.18    12.19    12.19    12.19    12.19    12.19    12.20     12.20     12.20     12.20     12.20     12.21    12.21    12.21    12.21    12.21    12.22    12.22    12.22    12.22    12.22    12.25    12.25    12.25    12.25    12.25    12.26    12.26    12.26    12.26    12.26    12.27    12.27    12.27    12.27    12.27    12.28    12.28    12.28    12.28    12.28    12.29    12.29    12.29    12.29    12.29    1.2    1.2    1.2    1.2    1.2    1.3    1.3    1.3    1.3    1.3    1.4    1.4    1.4    1.4    1.4    1.5    1.5    1.5    1.5    1.5    1.8    1.8    1.8    1.8    1.8    1.9    1.9    1.9    1.9    1.9    1.10     1.10     1.10     1.10     1.10     1.11    1.11    1.11    1.11    1.11    1.12    1.12    1.12    1.12    1.12    1.15    1.15    1.15    1.15    1.15    1.16    1.16    1.16    1.16    1.16    1.17    1.17    1.17    1.17    1.17    1.18    1.18    1.18    1.18    1.18    1.19    1.19    1.19    1.19    1.19";
    NSString *s2 = @"网易新增激活用户    37029    243    165    844    426386    37031    253    173    874    437496    37041    265    180    874    437496    37045    274    188    874    437496    37051    293    203    874    437496    37065    308    212    898    449146    37075    314    215    898    449146    37077    318    219    948    480871    37077    318    218    953    481241    37077    319    219    953    481241    37079    328    222    953    481241    37080    331    227    953    481241    37080    331    228    953    481241    37080    343    240    958    483277    37080    350    246    963    483660    37081    354    249    993    492293    37081    356    249    1027    506383    37081    356    250    1037    508538    37081    358    251    1037    508538    37083    359    252    1071    518657    37083    362    254    1105    539481    37083    365    257    1134    562070    37083    369    258    1134    562070    37083    371    260    1148    581197    37083    378    263    1171    594761    37083    381    264    1176    596001    37083    382    265    1176    596001    37083    386    269    1176    596001    37083    387    268    1176    596001";
    NSString *s3 = @"网易新增激活_非羊毛_实时更新    32691    190    124    775    394187    37032    254    174    875    437497    32702    212    139    805    405297    32706    221    147    805    405297    32711    240    162    805    405297    32719    255    171    829    416947    32725    261    174    829    416947    32726    265    178    879    448671    32708    265    178    884    449041    32623    266    179    884    449041    32459    275    183    884    449041    32456    278    188    884    449041    32434    278    189    884    449041    32402    287    198    869    440554    32385    293    203    874    440937    32360    296    205    904    449570    32359    298    205    939    463660    32358    298    206    949    465815    32358    300    207    949    465815    32357    301    208    978    474948    32356    303    209    1011    495772    32350    306    212    1041    518361    34568    360    251    1084    541254    34566    362    253    1098    560381    34561    369    256    1120    573945    34561    372    257    1125    575185    34561    373    258    1125    575185    34561    377    262    1125    575185    34531    378    261    1125    575185";
    
    NSString *s4 = @"网易新增激活_非羊毛_一次性更新    34826    212    141    806    404479    37033    255    175    876    437498    34838    234    156    836    415589    34842    243    164    836    415589    34848    262    179    836    415589    34861    277    188    860    427239    34871    283    191    860    427239    34873    287    195    910    458964    34873    287    195    915    459334    34873    288    196    915    459334    34875    297    200    915    459334    34876    300    205    915    459334    34876    300    206    915    459334    34876    312    218    920    461370    34876    319    224    925    461753    34877    323    227    955    470386    34877    325    227    989    484476    34877    325    228    999    486631    34877    327    229    999    486631    34879    328    230    1028    495764    34879    331    232    1062    516588    34879    334    235    1091    539177    34879    338    236    1091    539177    34879    340    238    1105    558304    34879    346    241    1110    562426    34879    349    241    1115    563666    34879    350    242    1115    563666    34879    354    246    1115    563666    34879    355    245    1115    563666";
    
    NSString *s5 = @"网易新增牛人牛股注册用户    20419    180    116    784    373447    37034    256    176    877    437499    20419    192    124    794    374497    20420    197    130    794    374497    20420    213    143    794    374497    20422    225    150    799    375624    20422    228    150    799    375624    20423    230    152    803    385840    20423    230    151    808    386210    #N/A    #N/A    #N/A    #N/A    #N/A    20423    236    152    808    386210    20423    237    155    808    386210    20423    237    155    808    386210    20423    241    159    812    388246    20423    243    161    817    388629    20423    244    162    847    397262    20423    244    162    882    411352    20423    244    162    892    413507    20423    245    163    892    413507    20424    246    164    926    423626    20424    247    165    951    436815    20424    248    166    965    446104    20424    252    167    965    446104    20424    254    168    979    465231    20424    258    170    1002    478795    20424    260    169    1007    480035    20424    260    169    1007    480035    20424    263    172    1007    480035    20424    264    171    1007    480035";
    
    NSString *s6 = @"网易新增股林大会活跃用户    4020    67    46    720    342513    37035    257    177    878    437500    4020    69    48    730    343563    4020    69    48    730    343563    4020    69    48    730    343563    4020    70    48    734    344690    4020    70    48    734    344690    4020    70    48    734    344690    4020    70    47    734    344690    #N/A    0    0    0   0   4020    70    47    734    344690    4020    70    47    734    344690    4020    70    47    734    344690    4020    71    48    739    346726    4020    71    48    739    346726    4020    72    49    769    355359    4020    72    49    804    369449    4020    72    49    814    371604    4020    72    49    814    371604    4020    72    49    848    381723    4020    73    50    872    394912    4020    73    50    887    404201    4020    73    50    887    404201    4020    73    50    901    423328    4020    73    50    924    436892    4020    73    50    929    438132    4020    73    50    929    438132    4020    73    50    929    438132    4020    73    50    929    438132";
    
    NSString *s7 = @"网易新增股林大会用户    16040    152    96    784    373447    37036    258    178    879    437501    16040    160    102    794    374497    16040    163    106    794    374497    16040    173    114    794    374497    16040    179    119    799    375624    16040    181    119    799    375624    16040    181    119    803    385840    16040    181    118    808    386210    0    0   0   0    0   16040    183    117    808    386210    16040    184    119    808    386210    16040    184    119    808    386210    16040    187    122    812    388246    16040    189    124    817    388629    16040    190    125    847    397262    16040    190    125    882    411352    16040    190    125    892    413507    16040    190    125    892    413507    16040    190    125    926    423626    16040    191    126    951    436815    16040    192    127    965    446104    16040    195    127    965    446104    16040    197    128    979    465231    16040    199    129    1002    478795    16040    200    127    1007    480035    16040    200    127    1007    480035    16040    203    130    1007    480035    16040    203    129    1007    480035";
    
    NSArray *a1 = [self toArray:s1];
    NSArray *a2 = [self toArray:s2];
    NSArray *a3 = [self toArray:s3];
    NSArray *a4 = [self toArray:s4];
    NSArray *a5 = [self toArray:s5];
    NSArray *a6 = [self toArray:s6];
    NSArray *a7 = [self toArray:s7];
    
    
    for (int j=0; j<5; j++) {
        NSMutableArray *mm = [NSMutableArray array];
        
        
        NSInteger beginWeek = 0;
        NSInteger week = 0;  // 上一个日子
        NSInteger v2 = 0;
        NSInteger v3 = 0;
        NSInteger v4 = 0;
        NSInteger v5 = 0;
        NSInteger v6 = 0;
        NSInteger v7 = 0;
        for (int i=j; i<a1.count; i=i+5) {
            NSInteger date = [[a1 objectAtIndex: i] integerValue];
            
            if (date - week == 1 || week == 0) {
                // in a week
                week = date;
                if (beginWeek == 0) {
                    beginWeek = date;
                }
                v2 = v2 + [[a2 objectAtIndex:i] integerValue];
                v3 = v3 + [[a3 objectAtIndex:i] integerValue];
                v4 = v4 + [[a4 objectAtIndex:i] integerValue];
                v5 = v5 + [[a5 objectAtIndex:i] integerValue];
                v6 = v6 + [[a6 objectAtIndex:i] integerValue];
                v7 = v7 + [[a7 objectAtIndex:i] integerValue];
            } else {
                // new week
                NSInteger weekend = week;
                NSString *s1 = [NSString stringWithFormat:@"%d - %d : %d, %d, %d, %d, %d, %d", beginWeek, weekend, v2, v3, v4, v5, v6, v7];
                NSLog(@"sylar : %@", s1);
                [mm addObject:s1];
                beginWeek = date;
                week = date;
                v2 = 0;
                v3 = 0;
                v4 = 0;
                v5 = 0;
                v6 = 0;
                v2 = v2 + [[a2 objectAtIndex:i] integerValue];
                v3 = v3 + [[a3 objectAtIndex:i] integerValue];
                v4 = v4 + [[a4 objectAtIndex:i] integerValue];
                v5 = v5 + [[a5 objectAtIndex:i] integerValue];
                v6 = v6 + [[a6 objectAtIndex:i] integerValue];
                v7 = v7 + [[a7 objectAtIndex:i] integerValue];
            }
        }
        // 结束了来一次
        NSString *ssss = [NSString stringWithFormat:@"%d - %d : %d, %d, %d, %d, %d, %d", beginWeek, 99, v2, v3, v4, v5, v6, v7];
        NSLog(@"sylar : %@", ssss);
        [mm addObject:ssss];
        
        NSLog(@"sylar : %d mmmmm = %@", j, mm);
    }
    
    
    
    NSLog(@"sylar : aa");
    
}

- (NSString *)removeDouHao:(NSString *)s1 {
    NSString *rt = [s1 stringByReplacingOccurrencesOfString:@"," withString:@""];
    rt = [s1 stringByReplacingOccurrencesOfString:@"#N/A" withString:@"0"];
    return rt;
}

- (NSString *)modify11:(NSString *)s1 {
    NSString *rt = s1;
    NSArray *aa = [s1 componentsSeparatedByString:@"."];
    if (aa.count == 2) {
        NSString *day = aa.lastObject;
        if (day.length == 1) {
            rt = [NSString stringWithFormat:@"%@.0%@", aa.firstObject, aa.lastObject];
        }
    }
    rt = [rt stringByReplacingOccurrencesOfString:@"." withString:@""];
    return rt;
}

- (NSArray *)toArray:(NSString *)s1 {
    NSString *s2 = [self removeDouHao:s1];
    
    NSArray *a1 = [s2 componentsSeparatedByString:@" "];
    NSMutableArray *arr  =[NSMutableArray array];
    for (NSString *ss in a1) {
        if (ss.length > 0) {
            NSString *ss1 = [self modify11:ss];
            [arr addObject:ss1];
        }
    }
    
    NSArray *rt = arr.copy;
    
    return rt;
}

@end

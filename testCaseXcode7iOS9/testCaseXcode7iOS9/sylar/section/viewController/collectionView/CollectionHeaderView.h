//
//  CollectionHeaderView.h
//  testCaseXcode7iOS9
//
//  Created by sylar on 16/9/12.
//  Copyright © 2016年 sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionHeaderView : UICollectionReusableView

@property (nonatomic, weak) IBOutlet UILabel *header;


+ (NSString *) getCellId;



@end

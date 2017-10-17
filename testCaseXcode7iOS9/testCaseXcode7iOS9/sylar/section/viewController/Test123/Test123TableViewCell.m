//
//  Test123TableViewCell.m
//  YYZPlus
//
//  Created by sylar on 2017/10/16.
//

#import "Test123TableViewCell.h"
#import "Masonry.h"


@interface Test123TableViewCell ()

@property (nonatomic, strong) UILabel *ll;

@end

@implementation Test123TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *ll = [[UILabel alloc] initWithFrame:CGRectZero];
        ll.text = @"label";
        _ll = ll;
        [self.contentView addSubview:ll];
        
        [ll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset = 0;
            make.bottom.offset = 0;
            make.left.offset = 0;
            make.right.offset = 0;
        }];
    }
    return self;
}

- (void)setTexttttt:(NSString *)aaa {
    _ll.text = aaa;
}

@end

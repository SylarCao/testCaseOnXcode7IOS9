//
//  TableViewCellVCTL.m
//  testCaseXcode7iOS9
//
//  Created by sylar on 2016/11/3.
//  Copyright © 2016年 sylar. All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
#import "TableViewCellVCTL.h"
#import "TableViewCell1.h"
#import "Masonry.h"
////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TableViewCellVCTL ()
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UIView *mainView;

@property (nonatomic, strong) UITableView *t1;


@property (nonatomic, weak) IBOutlet UIPageControl *ppp;

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TableViewCellVCTL

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self fun1];
    
//    [self fun2];
    
    [self fun3];
}

- (IBAction)btn1:(id)sender
{
    [self funBtn2];
}

- (void)funBtn2
{
    NSLog(@"%f, %f", _ppp.frame.size.width, _ppp.frame.size.height);
}

- (void)funBtn1
{
    TableViewCell1 *cell = nil;
    //    cell = [_t1 dequeueReusableCellWithIdentifier:@"TableViewCell1" forIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell = [[TableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell1"];
    cell.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *cc = cell.contentView;
    //    [cc removeFromSuperview];
    //    cc.translatesAutoresizingMaskIntoConstraints = NO;
    [_mainView addSubview:cell];
    
    //    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.offset = 0;
    //        make.bottom.offset = 0;
    //        make.left.offset = 0;
    //        make.right.offset = 0;
    //    }];
    
    //    cell.frame = CGRectMake(0, 0, 50, 50);    // it works
    
    
    NSDictionary *dict = NSDictionaryOfVariableBindings(cell);
    NSArray *c2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[cell]-0-|" options:0 metrics:nil views:dict];
    NSArray *c3 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[cell]-0-|" options:0 metrics:nil views:dict];
    [_mainView addConstraints:c2];
    [_mainView addConstraints:c3];
    
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        CGRect ff = cell.contentView.frame;
        NSLog(@"ff = %f, %f, %f, %f", ff.origin.x, ff.origin.y, ff.size.width, ff.size.height);
        cell.contentView.frame = CGRectMake(0, 0, ff.size.width, ff.size.height);
    });
}

- (void)fun3
{
    _ppp.pageIndicatorTintColor = [UIColor redColor];
    _ppp.backgroundColor = [UIColor yellowColor];
    _ppp.currentPageIndicatorTintColor = [UIColor blueColor];
}

- (void)fun2
{
    UITableView *t1 = [[UITableView alloc] initWithFrame:CGRectMake(50, 60, 200, 40) style:UITableViewStylePlain];
//    [t1 registerClass:[TableViewCell1 class] forCellReuseIdentifier:@"TableViewCell1"];
    t1.dataSource = self;
    t1.delegate = self;
    [self.view addSubview:t1];
    _t1 = t1;

}

- (void)fun1
{
    TableViewCell1 *cell = [[TableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abcde"];
    [_mainView addSubview:cell];
    
    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 0;
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
    }];
    
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell1 *rt = nil;
    
    // dequeue
//    rt = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell1" forIndexPath:indexPath];
    
    
    // init
    rt = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell1"];
    if (rt == nil)
    {
        rt = [[TableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell1"];
    }
    
    
    
    
    return rt;
}


@end

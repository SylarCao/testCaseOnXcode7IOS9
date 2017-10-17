//
//  Test123ViewController.m
//  YYZPlus
//
//  Created by sylar on 2017/10/16.
//

#import "Test123ViewController.h"
#import "Test123TableViewCell.h"
#import "Masonry.h"
#import "TabelViewHeaderCodeView.h"

@interface Test123ViewController ()  <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;

@end

@implementation Test123ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn addTarget:self action:@selector(fun123) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"123" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset = 0;
        make.left.offset = 0;
        make.right.offset = 0;
        make.height.offset = 60;
    }];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    _table = table;
    
    [table registerClass:[Test123TableViewCell class] forCellReuseIdentifier:@"Test123TableViewCell"];
    [table registerClass:[TabelViewHeaderCodeView class] forHeaderFooterViewReuseIdentifier:[TabelViewHeaderCodeView getCellId]];
    
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 0;
        make.bottom.equalTo(btn.mas_top).offset(0);
        make.left.offset = 0;
        make.right.offset = 0;
    }];
    
    if(@available(iOS 11.0, *)){
        NSLog(@"sylar :  ios 11");
        // reference link: http://www.10tiao.com/html/330/201707/2653579210/1.html
//        self.table.estimatedRowHeight = 0;
//        self.table.estimatedSectionHeaderHeight = 0;
//        self.table.estimatedSectionFooterHeight = 0;
    }
}

- (void)fun123 {
    NSLog(@"sylar :  *** reload data");
    [_table reloadData];
    NSLog(@"sylar :  end load = (%f, %f)", _table.contentSize.width, _table.contentSize.height);
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"sylar :  numberOfRowsInSection  ------- (%ld)", section);
    NSInteger rt = section + 6;
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat rt = indexPath.row * 20 + 70;
    if (indexPath.section < 2) {
//        NSLog(@"sylar :  height(%ld, %ld) = %f", indexPath.section, indexPath.row, rt);
    }
    return rt;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Test123TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Test123TableViewCell" forIndexPath:indexPath];
    [cell setTexttttt:[NSString stringWithFormat:@"aa = %ld - %ld", indexPath.section, indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 有了这个 可以不用设置 estimatedRowHeight
    CGFloat rt = indexPath.row * 20 + 70;
    if (indexPath.section < 2) {
    }
    return rt;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat rt = 0;
    if (section != 0) {
        rt = 50;
    }
    return rt;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TabelViewHeaderCodeView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[TabelViewHeaderCodeView getCellId]];
    [header setWithIndex:section];
    return header;
}

@end

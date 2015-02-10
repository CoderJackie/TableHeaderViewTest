//
//  ViewController.m
//  TableHeaderViewTest
//
//  Created by xujiaqi on 15/2/10.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UILabel *_label;
    UIView *_headerView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 220, 100)];
    _headerView.backgroundColor = [UIColor redColor];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 30)];
    _label.text = @"123123";
    
    [_headerView addSubview:_label];
    
    self.tableView.tableHeaderView = _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    
    if (self.tableView.tableHeaderView.frame.size.height == 100) {
        
        CGFloat height = 200;
        CGRect frame = _headerView.frame;
        frame.size.height = height;
        
        UIView *view=self.tableView.tableHeaderView;
        view.frame=frame;
        self.tableView.tableHeaderView =view;
        
    } else {
        CGFloat height = 100;
        CGRect frame = _headerView.frame;
        frame.size.height = height;
        
        UIView *view=self.tableView.tableHeaderView;
        view.frame=frame;
        self.tableView.tableHeaderView =view;
    }
    
    /*
     重新设置完tableHeaderView高度必须将View重新设置给self.tableView.tableHeaderView，
     不能用[self.tableView reloadData];
     reloadData不会对tableHeaderView其任何作用
     */
    
    if ([_label.text isEqualToString:@"123123"]) {
        _label.text = @"asdasd";
    } else {
        _label.text = @"123123";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"123123";
    return cell;
}
@end

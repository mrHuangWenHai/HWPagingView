//
//  HWPageStyleSelectTableViewController.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWPageStyleSelectTableViewController.h"
#import "HWPageFactory.h"
#import "HWNeiHanTableViewController.h"

@interface HWPageStyleSelectTableViewController ()
@property(nonatomic, strong)NSArray* dataSource;
@end

@implementation HWPageStyleSelectTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"resuing"];
    
    self.dataSource = @[@"静止样式",@"滚动样式",@"内涵段子"];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resuing" forIndexPath:indexPath];

    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray* staticTitleArray = @[@"精选",@"等待已结束",@"钉钉",@"内涵段子"];
    NSArray* rollStyleTitleAray = @[@"精选",@"电影",@"综艺",@"NBA",@"娱乐",@"动漫",@"演唱会",@"VIP会员"];
    HWNeiHanTableViewController* neiHan = [[HWNeiHanTableViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:neiHan];
    
    switch (indexPath.row) {
        case 0:
          //  NSArray* titleArray = ;
            [self.navigationController pushViewController:[HWPageFactory createViewControllerWith:staticTitleArray and:StaticStyle] animated:YES];
            break;
            
        case 1:
            
            [self.navigationController pushViewController:[HWPageFactory createViewControllerWith:rollStyleTitleAray     and:RollStyle] animated:YES];
            break;
        
        case 2:

            [self presentViewController:nav animated:YES completion:nil];
        

            
        default:
            break;
    }
    
   
    
}






@end

//
//  HWNeiHanTableViewController.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWNeiHanTableViewController.h"
#import "HWNeiHanTableViewCell.h"
#import "NeiHanModel.h"
#import "HWNeiHanImageView.h"
#import "HWPageFactory.h"
#import "HWPageHander.h"

@interface HWNeiHanTableViewController ()

@property(nonatomic, strong)NSMutableArray<NeiHanModel*>* dataSourceArray;
@property(nonatomic, strong)HWPageHander* hander;
@end

@implementation HWNeiHanTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    [self.tableView registerClass:[HWNeiHanTableViewCell class] forCellReuseIdentifier:@"resue"];
    self.dataSourceArray = [[NSMutableArray alloc] init];
    NSArray* titleArray = @[@"推荐",@"视频",@"直播",@"图片",@"段子",@"精华",@"关注"];
    
    self.hander = [[HWPageHander alloc] initPageWith:titleArray and:RollStyle];
    [self.hander.pageView.topLayer removeFromSuperlayer];
    [self.hander.pageView.bottomLayer removeFromSuperlayer];
    self.navigationItem.titleView = self.hander.pageView;
    
    NeiHanModel* model1 = [[NeiHanModel alloc] init];
    model1.type = Image;
    model1.headImageUrl = @"head1";
    model1.autherName = @"myself5201314";
    model1.categoryName = @"奇葩新闻";
    model1.introduce = @"段友们，你们怎么看啊？？";
    model1.playNumber = 0;
    model1.videoLength = 0;
    
    HWWonderfulComment* wonderfulComment = [[HWWonderfulComment alloc] init];
    wonderfulComment.headImageUrl = @"comment1";
    wonderfulComment.autherName = @"弦已断人终散1...";
    wonderfulComment.comment = @"没了，有其他电影，但是他把孙悟空演的太好了，人们自觉把其他的都忽略了。所以，他把孙悟空演活了，也把孙悟空演死了。这是一个演员的荣誉，也是演员的悲哀。";
    wonderfulComment.likeNumber = 31902;
    
    model1.wonderfulComment = wonderfulComment;
    model1.likeNumber = 53740;
    model1.dislikeNumber = 638;
    model1.leaveMessageNumber = 674;
    model1.imageurlArray = @[@"content1"];
    model1.shareNumber = 12;
    
    
    
    
    
    
    
    
    
    
    
    
    NeiHanModel* model2 = [[NeiHanModel alloc] init];
    model2.type = Image;
    model2.headImageUrl = @"head2";
    model2.autherName = @"污男183519898";
    model2.categoryName = @"奇葩新闻";
    model2.introduce = @"我没有后台也没上过热门😄只是想让她知道我能等！";
    model2.playNumber = 0;
    model2.videoLength = 0;
    model2.likeNumber = 132;
    model2.dislikeNumber = 638;
    model2.leaveMessageNumber = 674;
    model2.imageurlArray = @[@"content2"];
    model2.shareNumber = 0;
    
    
    NeiHanModel* model3 = [[NeiHanModel alloc] init];
    model3.type = Image;
    model3.headImageUrl = @"head3";
    model3.autherName = @"炊野公子";
    model3.categoryName = @"奇葩新闻";
    model3.introduce = @"我还以为中国马路上也有3D画！掉进坑的刘先生一脸兴奋的跟民警说。（为什么别人都是几万赞，我十几个赞都没有？？";
    model3.playNumber = 0;
    model3.videoLength = 0;
    model3.likeNumber = 132;
    model3.dislikeNumber = 638;
    model3.leaveMessageNumber = 674;
    model3.imageurlArray = @[@"content3",@"content4",@"content5",@"content6"];
    model3.shareNumber = 0;
    
    [self.dataSourceArray addObject:model3];
    [self.dataSourceArray addObject:model1];
    [self.dataSourceArray addObject:model2];
    self.tableView.tableFooterView = [[UIView alloc] init];

    

}

- (void)viewDidLayoutSubviews {
    CGFloat width = CGRectGetWidth(self.view.frame);
    self.hander.pageView.frame = CGRectMake(0, 0, width, 64);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NeiHanModel* model = self.dataSourceArray[indexPath.row];
    return model.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HWNeiHanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resue" forIndexPath:indexPath];
    cell.model = self.dataSourceArray[indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

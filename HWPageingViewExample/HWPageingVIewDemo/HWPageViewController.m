//
//  HWPageViewController.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWPageViewController.h"
#import "HWPageHander.h"

@interface HWPageViewController ()

@property(nonatomic, strong)HWPageHander* hander;
@end

@implementation HWPageViewController

- (instancetype)initWith:(NSArray*)titleArray and:(HWPageStyle)style {
    
    self.style = style;
    
    self = [super init];
    
    if (self)
    {
 
        self.hander = [[HWPageHander alloc] initPageWith:titleArray and:style];
    
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.hander.pageView];
    
    

}

- (void)viewDidLayoutSubviews {
    
    CGFloat width = CGRectGetWidth(self.view.bounds);

        self.hander.pageView.frame = CGRectMake(0, 64, width, 50);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

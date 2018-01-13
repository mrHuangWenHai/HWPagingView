//
//  HWPageViewController.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pagedefine.h"

@interface HWPageViewController : UIViewController

@property(nonatomic, assign)HWPageStyle style;

- (instancetype)initWith:(NSArray*)titleArray and:(HWPageStyle)style;

@end

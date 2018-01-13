//
//  HWPageFactory.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWPageFactory.h"
#import "HWPageViewController.h"

@implementation HWPageFactory

+ (UIViewController*)createViewControllerWith:(NSArray*)titleArray and:(HWPageStyle)style {
    
    UIViewController* controller = nil;
    controller = [[HWPageViewController alloc] initWith:titleArray and:style];
    
    return controller;
}

@end

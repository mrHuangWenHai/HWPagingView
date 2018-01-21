//
//  HWPageHander.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWPageHander.h"

@implementation HWPageHander

- (instancetype)initPageWith:(NSArray*)titleArray and:(HWPageStyle)style
{
    self = [super init];
    
    if (self)
    {
        self.pageView = [[HWPageView alloc] initWith:titleArray and:style];
    }
    return self;
}

@end

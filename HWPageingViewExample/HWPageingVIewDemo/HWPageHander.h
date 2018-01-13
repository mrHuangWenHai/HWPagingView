//
//  HWPageHander.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageView.h"
#import "Pagedefine.h"

@interface HWPageHander : NSObject

@property(nonatomic, strong)PageView* pageView;

- (instancetype)initPageWith:(NSArray*)titleArray and:(HWPageStyle)style;

@end

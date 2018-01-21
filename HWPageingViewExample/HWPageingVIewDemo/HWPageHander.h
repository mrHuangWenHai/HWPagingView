//
//  HWPageHander.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/10.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HWPageView.h"
#import "HWPagedefine.h"

@interface HWPageHander : NSObject

@property(nonatomic, strong)HWPageView* pageView;

- (instancetype)initPageWith:(NSArray*)titleArray and:(HWPageStyle)style;

@end

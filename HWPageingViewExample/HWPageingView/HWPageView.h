//
//  HWPageView.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWPagedefine.h"

@interface HWPageView : UIView

@property(nonatomic, assign)HWPageStyle style;
@property(nonatomic, strong)NSArray* titleArray;

- (instancetype)initWith:(NSArray*)titleArray and:(HWPageStyle)style;

- (void)hideTopAndBottomLayer;

@end

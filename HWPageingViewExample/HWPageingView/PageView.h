//
//  PageView.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pagedefine.h"

@interface PageView : UIView

@property(nonatomic, assign)HWPageStyle style;
@property(nonatomic, strong)CALayer* topLayer;
@property(nonatomic, strong)CALayer* bottomLayer;
@property(nonatomic, strong)NSArray* titleArray;

- (instancetype)initWith:(NSArray*)titleArray and:(HWPageStyle)style;

@end

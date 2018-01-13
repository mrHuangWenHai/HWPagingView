//
//  NeiHanResultShowView.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NeiHanModel;
@interface NeiHanResultShowView : UIView

@property(nonatomic, strong)NeiHanModel* model;

- (instancetype)initWithModel:(NeiHanModel*)model;

@end

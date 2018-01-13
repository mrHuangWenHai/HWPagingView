//
//  HWNeiHanImageView.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/13.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWNeiHanImageView : UIView

@property(nonatomic, strong)NSArray* imageUrlArray;

- (instancetype)initWith:(NSArray*)imageUrlArray;


@end

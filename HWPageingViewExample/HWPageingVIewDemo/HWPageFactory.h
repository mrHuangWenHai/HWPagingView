//
//  HWPageFactory.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HWPagedefine.h"



@interface HWPageFactory : NSObject

+ (UIViewController*)createViewControllerWith:(NSArray*)titleArray and:(HWPageStyle)style;

@end

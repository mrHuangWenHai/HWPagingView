//
//  HWWonderfulComment.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWWonderfulComment : NSObject

@property(nonatomic, copy)NSString* headImageUrl;
@property(nonatomic, copy)NSString* autherName;
@property(nonatomic, assign)NSInteger likeNumber;
@property(nonatomic, copy)NSString* comment;

@end

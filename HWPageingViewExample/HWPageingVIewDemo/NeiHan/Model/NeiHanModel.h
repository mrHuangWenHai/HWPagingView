//
//  NeiHanModel.h
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HWWonderfulComment.h"

typedef NS_ENUM(NSInteger, HWContentType)
{
    Image,
    Text,
    Video
};

@interface NeiHanModel : NSObject
@property(nonatomic, assign)HWContentType type;
@property(nonatomic, copy)NSString* headImageUrl;
@property(nonatomic, copy)NSString* autherName;
@property(nonatomic, copy)NSString* categoryName;
@property(nonatomic, copy)NSString* introduce;
@property(nonatomic, assign)NSInteger playNumber;
@property(nonatomic, assign)NSInteger videoLength;
@property(nonatomic, strong)HWWonderfulComment* wonderfulComment;
@property(nonatomic, assign)NSInteger likeNumber;
@property(nonatomic, assign)NSInteger dislikeNumber;
@property(nonatomic, assign)NSInteger leaveMessageNumber;
@property(nonatomic, assign)NSInteger shareNumber;
@property(nonatomic, copy)NSArray* imageurlArray;

- (CGFloat)cellHeight;

- (CGFloat)imageViewHeight;

- (CGFloat)commentViewHeight;
@end

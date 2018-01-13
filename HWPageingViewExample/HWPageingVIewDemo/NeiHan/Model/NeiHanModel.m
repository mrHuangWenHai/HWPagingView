//
//  NeiHanModel.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "NeiHanModel.h"

@implementation NeiHanModel

- (CGFloat)cellHeight {
    
    CGFloat height = 120;
    
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:15]};
    height += [self textHeightWith:attributes and:_introduce];
    
    if (_wonderfulComment != nil)
    {
        height = height + [self commentViewHeight];
    }
    
    height = height + [self imageViewHeight];
    
    return height;
}

- (CGFloat)commentViewHeight {
    
    CGFloat height = 0;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:15]};
    height = [self textHeightWith:attributes and:_wonderfulComment.comment] + 65;
    return height;
}

- (CGFloat)textHeightWith:(NSDictionary*)attributes and :(NSString*)text{
    
    NSRange range=NSMakeRange(0, text.length);
    CGFloat height = 0;
    if(range.length != 0){
        NSMutableAttributedString*attr=[[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
        NSDictionary*dic=[attr attributesAtIndex:0 effectiveRange:&range];
        CGSize size=[text boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 20, 300) options: NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        height = size.height;
    }
    
    return height;
}

- (CGFloat)imageViewHeight {
    
    CGFloat height = 0;
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    if (_imageurlArray.count == 1) {
        
        UIImage* image = [UIImage imageNamed:_imageurlArray.firstObject];
        height = (image.size.height / image.size.width) * (width - 10);
    }
    else
    {
        CGFloat imageWidth = (width - 20) / 3;
        height = (_imageurlArray.count / 3) * (imageWidth + 5);
        if (_imageurlArray.count % 3 != 0) {
            height = height + imageWidth;
        }
        else
        {
            height -= 5;
        }
    }
    return height;
}
@end

//
//  HWNeiHanImageView.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/13.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWNeiHanImageView.h"
@interface HWNeiHanImageView()
@property(nonatomic, strong)NSMutableArray<UIImageView*>* imageViewArray;
@end

@implementation HWNeiHanImageView

- (instancetype)initWith:(NSArray*)imageUrlArray
{
    self = [super init];
    if (self)
    {
        self.imageUrlArray = imageUrlArray;
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews {
    
    self.imageViewArray = [[NSMutableArray alloc] init];
    for (NSString* imageUrl in self.imageUrlArray)
    {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageUrl]];
        [self addSubview:imageView];
        [self.imageViewArray addObject:imageView];
    }
}

- (void)layoutSubviews {
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    if (self.imageViewArray.count == 1)
    {
        UIImageView* imageView = self.imageViewArray.firstObject;
        imageView.frame = CGRectMake(0, 0, width , height);
        return;
    }
    
    CGFloat imageWidth = (width - 10) / 3;
    for (int i = 0; i < self.imageViewArray.count; i++) {
        
        UIImageView* imageView = [self.imageViewArray objectAtIndex:i];
        if (i % 3 == 0)
        {
            imageView.frame = CGRectMake(0, (i/3)*(imageWidth + 5), imageWidth, imageWidth);
        }
        else
        {
            imageView.frame = CGRectMake((imageWidth + 5)*(i%3), (i/3)*(imageWidth + 5), imageWidth, imageWidth);
        }
        
    }
    
}

@end

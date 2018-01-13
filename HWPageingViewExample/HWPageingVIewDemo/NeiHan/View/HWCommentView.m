//
//  HWCommentView.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/13.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWCommentView.h"
#import "NeiHanModel.h"
#import "UIImage+Extension.h"
#import "UIView+Frame.h"

@interface HWCommentView()

@property(nonatomic, strong)UIImageView* headImageView;
@property(nonatomic, strong)UILabel* autherLabel;
@property(nonatomic, strong)UIImageView* likeImageView;
@property(nonatomic, strong)UILabel* likeLabel;
@property(nonatomic, strong)UIImageView* shareImageView;
@property(nonatomic, strong)UILabel* commentLabel;
@end

@implementation HWCommentView

- (instancetype)initWithModel:(NeiHanModel*)model
{
    self = [super init];
    if (self)
    {
        self.model = model;
        [self loadSubviews];
    }
    return self;
}

- (NSString*)convertNumberToStringWith:(NSInteger )number {
    
    NSString* text;
    if (number > 10000)
    {
        text = [NSString stringWithFormat:@"%ld.%ld万",number / 10000,(number - 10000)/1000];
    }
    else
    {
        text = [NSString stringWithFormat:@"%ld",number];
    }
    return text;
}

- (void)loadSubviews {
    
    self.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    
    HWWonderfulComment* commentModel = self.model.wonderfulComment;
    self.headImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:commentModel.headImageUrl] circleImage]];
    self.autherLabel = [[UILabel alloc] init];
    self.autherLabel.text = commentModel.autherName;
    self.autherLabel.font = [UIFont systemFontOfSize:10];
    self.likeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"digupicon_textpage"]];
    self.likeLabel = [[UILabel alloc] init];
    self.likeLabel.text = [self convertNumberToStringWith:commentModel.likeNumber];
    self.likeLabel.textColor = [UIColor colorWithRed:192.0/255 green:192.0/255 blue:192.0/255 alpha:1];
    self.shareImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moreicon_textpage"]];
    self.commentLabel = [[UILabel alloc] init];
    self.commentLabel.text = commentModel.comment;
    
    [self addSubview:self.headImageView];
    [self addSubview:self.autherLabel];
    [self addSubview:self.likeImageView];
    [self addSubview:self.likeLabel];
    [self addSubview:self.shareImageView];
    [self addSubview:self.commentLabel];
}

- (void)layoutSubviews {
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat spare = 10;
    CGFloat imageWidth = 30;
    self.headImageView.frame = CGRectMake(spare, spare, imageWidth, imageWidth);
    self.autherLabel.frame = CGRectMake(self.headImageView.dtWidth+5, spare, width/2, imageWidth);
    self.shareImageView.frame = CGRectMake(width - 10 - imageWidth, 10, imageWidth, imageWidth);
    self.likeLabel.frame = CGRectMake(0, 0, width, imageWidth);
    [self.likeLabel sizeToFit];
    CGRect frame = self.likeLabel.frame;
    frame.origin.x = self.shareImageView.frame.origin.x - spare - CGRectGetWidth(frame);
    frame.origin.y = spare;
    self.likeLabel.frame = frame;
    self.likeImageView.frame = CGRectMake(self.likeLabel.frame.origin.x - spare - imageWidth, spare, imageWidth, imageWidth);
    CGPoint center = self.likeLabel.center;
    center.y = self.likeImageView.center.y;
    self.likeLabel.center = center;
    
    self.commentLabel.frame = CGRectMake(spare, self.headImageView.dtHeight + spare, width - 20, 0);
    self.commentLabel.numberOfLines = 0;
    [self.commentLabel sizeToFit];
}

@end

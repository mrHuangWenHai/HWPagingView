//
//  NeiHanResultShowView.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "NeiHanResultShowView.h"
#import "NeiHanModel.h"
#import "UIView+Frame.h"

@interface NeiHanResultShowView()
@property(nonatomic, strong)UIImageView* likeImageView;
@property(nonatomic, strong)UIImageView* dislikeImageView;
@property(nonatomic, strong)UIImageView* messageImageView;
@property(nonatomic, strong)UIImageView* shareImageView;
@property(nonatomic, strong)UILabel* likeLabel;
@property(nonatomic, strong)UILabel* dislikeLabel;
@property(nonatomic, strong)UILabel* messageLabel;
@property(nonatomic, strong)UILabel* shareLabel;
@end;


@implementation NeiHanResultShowView

- (instancetype)initWithModel:(NeiHanModel*)model {
    
    self = [super init];
    if (self) {
        self.model = model;
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews {
    
    self.likeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"digupicon_textpage"]];
    self.dislikeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"digdownicon_textpage"]];
    self.messageImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"commenticon_textpage"]];
    self.shareImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moreicon_textpage"]];
    self.likeLabel = [[UILabel alloc] init];
    self.dislikeLabel = [[UILabel alloc] init];
    self.messageLabel = [[UILabel alloc] init];
    self.shareLabel = [[UILabel alloc] init];
    
    [self addSubview:self.likeImageView];
    [self addSubview:self.dislikeImageView];
    [self addSubview:self.messageImageView];
    [self addSubview:self.shareImageView];
    [self addSubview:self.likeLabel];
    [self addSubview:self.dislikeLabel];
    [self addSubview:self.messageLabel];
    [self addSubview:self.shareLabel];
    
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

- (void)layoutSubviews {
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat spare = 10;
    CGFloat imageWidth = 30;
    self.likeImageView.frame = CGRectMake(spare, spare, imageWidth , imageWidth);
    
    self.likeLabel.frame = CGRectMake(spare * 2 + imageWidth, spare, width, imageWidth);
    self.likeLabel.text = [self convertNumberToStringWith:self.model.likeNumber];
    [self.likeLabel sizeToFit];
    CGPoint center = self.likeLabel.center;
    center.y = self.likeImageView.center.y;
    self.likeLabel.center = center;
    
    self.dislikeImageView.frame = CGRectMake(self.likeLabel.dtWidth + spare, spare, imageWidth, imageWidth);
    self.dislikeLabel.frame = CGRectMake(self.dislikeImageView.dtWidth + spare, spare, width, imageWidth);
    self.dislikeLabel.text = [self convertNumberToStringWith:self.model.dislikeNumber];
    [self.dislikeLabel sizeToFit];
    CGPoint center1 = self.dislikeLabel.center;
    center1.y = center.y;
    self.dislikeLabel.center = center1;
    
    self.messageImageView.frame = CGRectMake(self.dislikeLabel.dtWidth + spare, spare, imageWidth, imageWidth);
    self.messageLabel.frame = CGRectMake(self.messageImageView.dtWidth + spare, spare, width, imageWidth);
    self.messageLabel.text = [self convertNumberToStringWith:self.model.leaveMessageNumber];
    [self.messageLabel sizeToFit];
    CGPoint center2 = self.messageLabel.center;
    center2.y = center.y;
    self.messageLabel.center = center2;
    
    self.shareLabel.frame = CGRectMake(0, spare, width, imageWidth);
    self.shareLabel.text = [self convertNumberToStringWith:self.model.shareNumber];
    [self.shareLabel sizeToFit];
    CGRect frame = self.shareLabel.frame;
    frame.origin.x = width - spare - CGRectGetWidth(frame);
    self.shareLabel.frame = frame;
    self.shareImageView.frame = CGRectMake(self.shareLabel.frame.origin.x - spare - imageWidth, spare, imageWidth, imageWidth);
    CGPoint center3 = self.shareLabel.center;
    center3.y = center.y;
    self.shareLabel.center = center3;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

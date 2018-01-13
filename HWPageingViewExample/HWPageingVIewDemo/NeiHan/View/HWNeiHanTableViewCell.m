//
//  HWNeiHanTableViewCell.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/12.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "HWNeiHanTableViewCell.h"
#import "NeiHanResultShowView.h"
#import "NeiHanModel.h"
#import "UIImage+Extension.h"
#import "UIView+Frame.h"
#import "HWNeiHanImageView.h"
#import "HWCommentView.h"

@interface HWNeiHanTableViewCell()

@property(nonatomic, strong)UIImageView* headImageView;
@property(nonatomic, strong)UILabel* autherNameLabel;
@property(nonatomic, strong)UILabel* introduceLabel;
@property(nonatomic, strong)UIView* neiHanContentView;
@property(nonatomic, strong)HWCommentView* commentView;
@property(nonatomic, strong)NeiHanResultShowView* resultView;

@end

@implementation HWNeiHanTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

}

- (void)setUp {
    
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat width = CGRectGetWidth(self.contentView.frame);
    CGFloat imageHeadWidth = 30;
    
    self.headImageView = [[UIImageView alloc] init];
    self.autherNameLabel = [[UILabel alloc] init];
    self.introduceLabel = [[UILabel alloc] init];
    
    self.headImageView.image = [[UIImage imageNamed:_model.headImageUrl] circleImage];
    self.headImageView.frame = CGRectMake(10, 15, imageHeadWidth, imageHeadWidth);
    
    self.autherNameLabel.text = _model.autherName;
    self.autherNameLabel.frame = CGRectMake(self.headImageView.dtWidth + 5, 15, 150, imageHeadWidth);
    self.autherNameLabel.textColor = [UIColor colorWithRed:211.0/255 green:211.0/255 blue:211.0/255 alpha:1];
    
    self.introduceLabel.text = _model.introduce;
    self.introduceLabel.frame = CGRectMake(10, self.autherNameLabel.dtHeight + 10, width - 20, 0);
    self.introduceLabel.numberOfLines = 0;
    [self.introduceLabel sizeToFit];
    
    if (_model.type == Image) {
        
        self.neiHanContentView = [[HWNeiHanImageView alloc] initWith:_model.imageurlArray];
        CGFloat height = [self.model imageViewHeight];
        self.neiHanContentView.frame = CGRectMake(5,self.introduceLabel.dtHeight + 5, width - 10, height);
    }
    
    self.resultView = [[NeiHanResultShowView alloc] initWithModel:_model];
    
    if (_model.wonderfulComment == nil)
    {
        self.resultView.frame = CGRectMake(0,self.neiHanContentView.dtHeight , width, 50);
    }
    else
    {
        self.commentView = [[HWCommentView alloc] initWithModel:_model];
        self.commentView.frame = CGRectMake(0, self.neiHanContentView.dtHeight + 5, width, [_model commentViewHeight]);
        [self.contentView addSubview:self.commentView];
        
        self.resultView.frame = CGRectMake(0, self.commentView.dtHeight, width, 50);
    }
    
    CALayer* layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1].CGColor;
    
    layer.frame = CGRectMake(0, self.resultView.dtHeight, width, 2);
    
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.autherNameLabel];
    [self.contentView addSubview:self.introduceLabel];
    [self.contentView addSubview:self.neiHanContentView];
    [self.contentView addSubview:self.resultView];
    [self.contentView.layer addSublayer:layer];
}


- (void)setModel:(NeiHanModel *)model {
    
    _model = model;
    [self setUp];
}

@end

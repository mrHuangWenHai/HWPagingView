//
//  PageView.m
//  HWPageingViewExample
//
//  Created by 黄文海 on 2018/1/9.
//  Copyright © 2018年 huang. All rights reserved.
//

#import "PageView.h"

@interface PageView()

@property(nonatomic, strong)UIScrollView* scrollView;
@property(nonatomic, strong)CALayer* indicateLayer;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, strong)NSMutableArray<UIButton* >* buttonArray;
@property(nonatomic, assign)CGFloat titleWidth;


@end

@implementation PageView

- (instancetype)initWith:(NSArray*)titleArray and:(HWPageStyle)style {
    
    self = [super init];
    
    if (self)
    {
        self.style = style;
        self.titleArray = [titleArray copy];
        self.titleWidth = 0;
        [self loadSubviews];
        [self loadDataSource];
    }
    
    return self;
}

- (void)loadSubviews {
    
    
    self.topLayer = [[CALayer alloc] init];
    self.topLayer.borderColor = [UIColor grayColor].CGColor;
    self.topLayer.borderWidth = 1;
    [self.layer addSublayer:self.topLayer];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    self.indicateLayer = [[CALayer alloc] init];
    self.indicateLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.scrollView.layer addSublayer:self.indicateLayer];
    
    self.buttonArray = [[NSMutableArray alloc] init];
    UIButton* optionButton;
    
    for (int i = 0; i < self.titleArray.count; i++)
    {
        optionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        optionButton.frame = CGRectMake(0, 1, 100, 100);
        [optionButton setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [optionButton sizeToFit];
        [optionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.buttonArray addObject:optionButton];
        optionButton.tag = i;
        [optionButton addTarget:self action:@selector(didselectButton:) forControlEvents:UIControlEventTouchUpInside];
        self.titleWidth += CGRectGetWidth(optionButton.frame);
        [self.scrollView addSubview:optionButton];
    }
    
    self.bottomLayer = [[CALayer alloc] init];
    self.bottomLayer.borderColor = [UIColor grayColor].CGColor;
    self.bottomLayer.borderWidth = 1;
    [self.layer addSublayer:self.bottomLayer];
    
}


- (void)loadDataSource {
    
    
    
}

- (void)didselectButton:(UIButton*)button {
    
    static UIButton* lastButton = NULL;
    if (lastButton != NULL)
    {
        [lastButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    lastButton = button;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = self.indicateLayer.frame;
        frame.origin.x = button.frame.origin.x;
        frame.size.width = button.frame.size.width;
        self.indicateLayer.frame = frame;
    }];
    
    if (self.style == RollStyle)
    {
        CGPoint point = [self.scrollView convertPoint:button.center toView:self];
        CGPoint centerPoint = self.center;
        CGFloat offset = 0;
        offset = point.x - centerPoint.x;
        CGFloat maxWidth = self.scrollView.contentSize.width;
        CGFloat x;
        
        if (offset < 0)
        {
            x = self.scrollView.contentOffset.x + offset;
            x = x < 0 ? 0 : x;
        }
        else
        {
            x = (offset + self.scrollView.contentOffset.x);
          //  x = (x + CGRectGetWidth(self.frame)) > maxWidth ? self.scrollView.contentOffset.x : x;
            x = (x + CGRectGetWidth(self.frame)) > maxWidth ? maxWidth - CGRectGetWidth(self.scrollView.frame) : x;
        }
        
        CGFloat y = self.scrollView.contentOffset.y;
        [self.scrollView setContentOffset:CGPointMake(x, y) animated:true];
    }
}

- (void)layoutSubviews {
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat lastY = 0;
    CGFloat spareWidth;
    
    self.scrollView.frame = CGRectMake(0, 1, width, height - 2);
    if (self.style == StaticStyle)
    {
        spareWidth = (width - self.titleWidth) / (self.titleArray.count + 1);
    }
    else
    {
        spareWidth = 20;
        CGFloat needWidth = self.titleWidth + (self.titleArray.count + 1 ) * spareWidth;
        if (width < needWidth)
        {
            self.scrollView.contentSize = CGSizeMake(needWidth, 0);
        }
    }
    
    for (UIButton* button in self.buttonArray) {
        
        CGRect frame = button.frame;
        frame.origin.x = lastY + spareWidth;
        lastY = frame.origin.x + CGRectGetWidth(frame);
        frame.size.height = CGRectGetHeight(self.scrollView.frame);
        button.frame = frame;
        
    }
    
    self.topLayer.frame = CGRectMake(0, 0, width, 1);
    self.bottomLayer.frame = CGRectMake(0, height-1, width, 1);
    self.indicateLayer.frame = CGRectMake(spareWidth, height - 5, CGRectGetWidth(self.buttonArray.firstObject.frame), 3);
}

@end

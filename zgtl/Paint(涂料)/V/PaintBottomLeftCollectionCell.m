//
//  PaintBottomLeftCollectionCell.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/20.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PaintBottomLeftCollectionCell.h"

@implementation PaintBottomLeftCollectionCell


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [UIImageView new];
        
        [self.contentView addSubview:_imageView];
        
//        _imageView.layer.cornerRadius = 5;
//        _imageView.layer.masksToBounds = YES;
        
        _imageView.layer.shadowOffset = CGSizeMake(5, 5);
        _imageView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        _imageView.layer.shadowOpacity = 0.8;
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(62, 62));
        }];
    }
    return self;
}

@end

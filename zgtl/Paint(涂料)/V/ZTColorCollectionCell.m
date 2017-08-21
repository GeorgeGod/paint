//
//  ZTColorCollectionCell.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ZTColorCollectionCell.h"

@implementation ZTColorCollectionCell


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        UIImageView *iv = [UIImageView new];
        iv.backgroundColor = [UIColor orangeColor];
        iv.layer.cornerRadius = 5;
        iv.layer.masksToBounds = YES;
        [self.contentView addSubview:iv];
        self.imageView = iv;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(32);
            make.centerX.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(115, 115));
        }];
        
        //描述
        UILabel *lb = [UILabel new];
        lb.text = @"效果图";
        lb.textColor = [UIColor darkTextColor];
        lb.font = [UIFont fontWithName:nil size:17];
        lb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:lb];
        self.titleLabel = lb;
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(iv.mas_bottom).offset(12);
            make.centerX.equalTo(self.contentView);
        }];
    }
    return self;
}


@end

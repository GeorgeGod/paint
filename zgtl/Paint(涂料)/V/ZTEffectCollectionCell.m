//
//  ZTEffectCollectionCell.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ZTEffectCollectionCell.h"

@implementation ZTEffectCollectionCell


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        UIImageView *iv = [UIImageView new];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        [self.contentView addSubview:iv];
        self.imageView = iv;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 0, 0));
            make.width.mas_equalTo(184);
        }];
        
        //描述
        UILabel *lb = [UILabel new];
        lb.text = @"效果图";
        lb.textColor = [UIColor darkTextColor];
        lb.font = [UIFont fontWithName:nil size:17];
        [self.contentView addSubview:lb];
        self.titleLabel = lb;
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iv.mas_right).offset(32);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}


@end

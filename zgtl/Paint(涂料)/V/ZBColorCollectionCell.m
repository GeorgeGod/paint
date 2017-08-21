//
//  ZBColorCollectionCell.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ZBColorCollectionCell.h"

@implementation ZBColorCollectionCell



-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        UIImageView *iv = [UIImageView new];
        iv.backgroundColor = [UIColor lightGrayColor];
        iv.layer.cornerRadius = 5;
        iv.layer.masksToBounds = YES;
        [self.contentView addSubview:iv];
        self.imageView = iv;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(48);
            make.centerX.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(150, 112));
        }];
        
        //描述
        UILabel *lb = [UILabel new];
        lb.text = @"卧室";
        lb.textColor = [UIColor darkTextColor];
        lb.font = [UIFont fontWithName:nil size:16];
        lb.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:lb];
        self.titleLabel = lb;
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(iv.mas_bottom).offset(4);
            make.centerX.equalTo(self.contentView);
        }];
    }
    return self;
}


@end

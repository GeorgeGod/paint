//
//  ZBEffectCollectionCell.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "ZBEffectCollectionCell.h"

@implementation ZBEffectCollectionCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        UIImageView *iv = [UIImageView new];
        [self.contentView addSubview:iv];
        self.imageView = iv;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(108, 108));
            make.center.equalTo(self.contentView);
        }];
    }
    return self;
}


@end

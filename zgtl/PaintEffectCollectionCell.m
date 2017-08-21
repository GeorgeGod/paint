//
//  PaintEffectCollectionCell.m
//  zgtl
//
//  Created by admin on 2017/8/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "PaintEffectCollectionCell.h"
#import "Masonry.h"

@implementation PaintEffectCollectionCell


-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //图片
        UIImageView *iv = [UIImageView new];
        iv.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 10, 0, 0));
            make.width.mas_equalTo(50);
        }];
        
        //描述
        UILabel *lb = [UILabel new];
        lb.text = @"效果图";
        lb.textColor = [UIColor darkTextColor];
        lb.font = [UIFont fontWithName:nil size:17];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(iv.mas_right).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}
@end

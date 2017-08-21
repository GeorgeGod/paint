//
//  PaintTopCollectionCell.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/17.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PaintTopCollectionCell.h"

@implementation PaintTopCollectionCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [UIImageView new];
        
        [self.contentView addSubview:_imageView];
        
//        _imageView.contentMode = UIViewContentModeCenter;
        
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
        }];
    }
    return self;
}
@end

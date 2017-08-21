//
//  BindEmailView.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/20.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BindEmailView.h"

@implementation BindEmailView

-(instancetype)init {
    self = [super init];
    if (self) {
        
        self.backgroundColor = [[UIColor colorwithHex:@"DDDDDD"] colorWithAlphaComponent:0.4];
        
        [self addContentView];
    }
    return self;
}


-(void)addContentView {
    
    //白色底板部分
    UIView *boardView = [ UIView new];
    
    [self addSubview:boardView];
    
    boardView.backgroundColor = [UIColor whiteColor];
    
    boardView.layer.cornerRadius = 20;
    boardView.layer.masksToBounds = YES;
    
    boardView.layer.borderColor = [UIColor colorwithHex:@"996c33"].CGColor;
    boardView.layer.borderWidth = 2;
    
    [boardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(556, 276));
    }];
    
    
    //标题
    UILabel *titleLabel = [UILabel new];
    
    titleLabel.text = @"请绑定邮箱";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:nil size:22];
    
    [boardView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(boardView);
        make.top.mas_equalTo(16);
    }];
    
    //用户名
    UILabel *tl1 = [UILabel new];
    tl1.textColor = [UIColor blackColor];
    UITextField *tf1 = [UITextField new];
    
    [boardView addSubview:tl1];
    [boardView addSubview:tf1];
    
    tl1.text = @"用户名:";
    tl1.font = [UIFont fontWithName:nil size:22];
    tf1.layer.borderWidth = 2;
    tf1.layer.borderColor = [UIColor blackColor].CGColor;
    tf1.layer.cornerRadius = 5;
    tf1.layer.masksToBounds = YES;
    
    [tl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(boardView).offset(122);
        make.top.equalTo(boardView).offset(72);
        make.width.mas_equalTo(80);
    }];
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tl1.mas_right).offset(14);
        make.size.mas_equalTo(CGSizeMake(216, 28));
        make.centerY.equalTo(tl1);
    }];
    
    
    //邮箱
    UILabel *tl2 = [UILabel new];
    tl2.textColor = [UIColor blackColor];
    UITextField *tf2 = [UITextField new];
    
    [boardView addSubview:tl2];
    [boardView addSubview:tf2];
    
    tl2.text = @"邮  箱:";
    tl2.font = [UIFont fontWithName:nil size:22];
    tf2.layer.borderWidth = 2;
    tf2.layer.borderColor = [UIColor blackColor].CGColor;
    tf2.layer.cornerRadius = 5;
    tf2.layer.masksToBounds = YES;
    
    [tl2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(boardView).offset(122);
        make.top.equalTo(tl1.mas_bottom).offset(26);
        make.width.mas_equalTo(80);
    }];
    [tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tl2.mas_right).offset(14);
        make.size.mas_equalTo(CGSizeMake(216, 28));
        make.centerY.equalTo(tl2);
    }];

    
    //验证码
    UIView *cv3 = [UIView new];
    UIView *cvl3 = [UIView new];
    UILabel *tl3 = [UILabel new];
    
    cv3 = [UIView new];
    cvl3 = [UIView new];
    cv3.layer.borderWidth = 2;
    cv3.layer.borderColor = [UIColor blackColor].CGColor;
    cv3.layer.cornerRadius = 5;
    cv3.layer.masksToBounds = YES;
    cvl3.backgroundColor = [UIColor blackColor];
    tl3.textColor = [UIColor blackColor];
    UITextField *tf3 = [UITextField new];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 addTarget:self action:@selector(sendVerifyCode:) forControlEvents:UIControlEventTouchUpInside];
    
    [boardView addSubview:cv3];
    [boardView addSubview:tl3];
    [cv3 addSubview:tf3];
    [cv3 addSubview:btn3];
    [cv3 addSubview:cvl3];
    
    tl3.text = @"验证码:";
    tl3.font = [UIFont fontWithName:nil size:22];
    [btn3 setTitle:@"发送验证码" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor colorwithHex:@"FFFFFF"] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont fontWithName:nil size:14];
    [btn3 setBackgroundImage:[UIImage imageWithColor:[UIColor colorwithHex:@"B5B5B5"]] forState:UIControlStateNormal];
    
    [tl3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(boardView).offset(122);
        make.top.equalTo(tl2.mas_bottom).offset(26);
        make.width.mas_equalTo(80);
    }];
    [cv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tl2.mas_right).offset(14);
        make.size.mas_equalTo(CGSizeMake(216, 28));
        make.centerY.equalTo(tl3);
    }];
    [tf3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cv3);
        make.size.mas_equalTo(CGSizeMake(120, 28));
        make.centerY.equalTo(tl3);
    }];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf3.mas_right);
        make.centerY.equalTo(tf3);
        make.size.mas_equalTo(CGSizeMake(96, 28));
    }];
    [cvl3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf3.mas_right);
        make.top.bottom.equalTo(cv3);
        make.width.mas_equalTo(2);
    }];
}


//发送验证码的回调事件
-(void)sendVerifyCode:(UIButton *)sender {
    
}


@end

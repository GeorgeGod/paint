//
//  PaintEffectController.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/20.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//  质感涂料

#import "PaintEffectController.h"
#import "PaintEffectView.h"

@interface PaintEffectController ()

@end

@implementation PaintEffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"质感涂料";
    
    PaintEffectView *paintEffectV = [PaintEffectView new];
    //    paintMainV.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:paintEffectV];
    
    [paintEffectV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end

//
//  PaintColorPictureController.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/20.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//  珍珠贝彩

#import "PaintColorPictureController.h"
#import "PaintColorView.h"

@interface PaintColorPictureController ()

@end

@implementation PaintColorPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"珍珠贝彩";
    
    
    PaintColorView *paintColorV = [PaintColorView new];
    //    paintMainV.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:paintColorV];
    
    [paintColorV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

@end

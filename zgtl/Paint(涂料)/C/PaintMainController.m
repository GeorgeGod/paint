//
//  PaintMainController.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/17.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PaintMainController.h"
#import "PaintMainView.h"
#import "PaintColorPictureController.h"
#import "PaintEffectController.h"


#import "BindEmailView.h"

@interface PaintMainController ()<PaintMainDelegate>

@end

@implementation PaintMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    PaintMainView *paintMainV = [PaintMainView new];
//    paintMainV.backgroundColor = [UIColor purpleColor];
    paintMainV.delegate = self;
    [self.view addSubview:paintMainV];
    
    [paintMainV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    
//    BindEmailView *bindEmailV = [BindEmailView new];
//    
//    [self.view addSubview:bindEmailV];
//    
//    [bindEmailV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        PaintColorPictureController *珍珠贝彩 = [PaintColorPictureController new];
        
        [self.navigationController pushViewController:珍珠贝彩 animated:YES];
    }
    else {
        PaintEffectController *质感涂料 = [PaintEffectController new];
        
        [self.navigationController pushViewController:质感涂料 animated:YES];
    }
}

@end

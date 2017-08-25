//
//  PaintColorPictureController.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/20.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//  珍珠贝彩

#import "PaintColorPictureController.h"
#import "PaintEffectController.h"
#import "PaintColorView.h"
//#import "PaintColorModel.h"
//#import "PaintProductModel.h"
#import "ColorPaintModel.h"
#import "ColorListModel.h"
#import "ColorSceneModel.h"


@interface PaintColorPictureController ()<PaintMainDelegate>

//左边的颜色数组
@property (nonatomic, strong) NSArray<ColorListModel *> *colorArray;

//右边的场景数组
@property (nonatomic, strong) NSArray<ColorPaintModel *> *bigPicArray;

//下边预览的数组
@property (nonatomic, strong) NSArray<ColorSceneModel *> *perviewArray;

@property (nonatomic, strong) PaintColorView *paintColorV;
@end

@implementation PaintColorPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"珍珠贝彩";
    
    
    self.paintColorV = [PaintColorView new];
    //    paintMainV.backgroundColor = [UIColor purpleColor];
    self.paintColorV.delegate = self;
    [self.view addSubview:self.paintColorV];
    
    [self.paintColorV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self requestData];
    
}

-(void)requestData {
    
    //修改参数吧
    NSDictionary *params = @{
                             @"colorId":@(self.colorId),
                             @"typeId":@(self.typeId),
                             @"productId":@(self.productId),
                             };
    NetWork *net = [NetWork new];
    [net PostDataWithUri:@"api/atz/productcolor/ColorPicture" params:params handler:^(NSDictionary *json) {
        
        NSLog(@"%@", json);
        
        if ([json[@"errocde"] intValue] == 0) {
            
            _colorArray = [ColorListModel mj_objectArrayWithKeyValuesArray:json[@"productlist"]];
            
            _bigPicArray = [ColorPaintModel mj_objectArrayWithKeyValuesArray:json[@"picturelist"]];
            
            _perviewArray = [ColorSceneModel mj_objectArrayWithKeyValuesArray:json[@"scenetypelist"]];
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.paintColorV setContentDataWithColorArr:_colorArray bigPicArr:_bigPicArray perviewArr:_perviewArray];
            });
        }
    }];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //获取模型
    ColorSceneModel *model = _perviewArray[indexPath.row];
    
    PaintEffectController *质感涂料 = [PaintEffectController new];
    质感涂料.typeId = model.id;
    质感涂料.productId = self.productId;
    [self.navigationController pushViewController:质感涂料 animated:YES];
}


@end

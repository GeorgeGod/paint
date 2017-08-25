//
//  PaintEffectController.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/20.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//  质感涂料

#import "PaintEffectController.h"
#import "PaintEffectView.h"
//#import "PaintColorModel.h"
#import "PaintEffectModel.h"


@interface PaintEffectController ()<PaintMainDelegate>

//左边的图片数组
@property (nonatomic, strong) NSArray<EffectPaintModel *> *paintArray;

//右边的场景数组
@property (nonatomic, strong) NSArray<EffectBigPicModel *> *bigPicArray;

//下边预览的数组
@property (nonatomic, strong) NSArray<EffectSceneModel *> *perviewArray;

@property (nonatomic, strong) PaintEffectView *paintEffectV;


@end

@implementation PaintEffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"质感涂料";
    
    self.paintEffectV = [PaintEffectView new];
    //    paintMainV.backgroundColor = [UIColor purpleColor];
    self.paintEffectV.delegate = self;
    [self.view addSubview:self.paintEffectV];
    
    [self.paintEffectV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    [self requestData];
}

-(void)requestData {
    
    //修改参数吧
    NSDictionary *params = @{
                             @"typeId":@(self.typeId),
                             @"productId":@(self.productId),
                             };
    NetWork *net = [NetWork new];
    [net PostDataWithUri:@"api/atz/productcolor/EffectPicture" params:params handler:^(NSDictionary *json) {
        
        NSLog(@"%@", json);
        
        if ([json[@"errocde"] intValue] == 0) {
            
            _paintArray = [EffectPaintModel mj_objectArrayWithKeyValuesArray:json[@"productlist"]];
            
            _bigPicArray = [EffectBigPicModel mj_objectArrayWithKeyValuesArray:json[@"effectpicture"]];
            
            _perviewArray = [EffectSceneModel mj_objectArrayWithKeyValuesArray:json[@"scenelist"]];
            
            
            
            
            
            //        _productArray = [PaintProductModel mj_objectArrayWithKeyValuesArray:json[@"producttypelist"]];
            //
            //        _colorArray = [PaintColorModel mj_objectArrayWithKeyValuesArray:json[@"colorlist"]];
            //
            //        _listArray = [PaintListModel mj_objectArrayWithKeyValuesArray:json[@"productlist"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.paintEffectV setContentDataWithPaintArr:_paintArray bigPicArr:_bigPicArray perviewArr:_perviewArray];
                
                //            [self.paintColorV setContentDataWithProductArr:_productArray colorArr:_colorArray listArr:_listArray];
            });
        }
    }];
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"处理点击事件");
}



@end

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


#import "PaintProductModel.h"
#import "PaintColorModel.h"
#import "PaintListModel.h"


#import "BindEmailView.h"

@interface PaintMainController ()<PaintMainDelegate>

@property (nonatomic, strong) NSArray<PaintProductModel *> *productArray;

@property (nonatomic, strong) NSArray<PaintColorModel *> *colorArray;

@property (nonatomic, strong) NSArray<PaintListModel *> *listArray;

@property (nonatomic, strong) PaintMainView *paintMainV;
@property (nonatomic, assign) NSInteger productId;
@property (nonatomic, assign) NSInteger colorId;

@end

@implementation PaintMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.paintMainV = [PaintMainView new];
//    paintMainV.backgroundColor = [UIColor purpleColor];
    self.paintMainV.delegate = self;
    [self.view addSubview:self.paintMainV];
    
    [self.paintMainV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    
//    BindEmailView *bindEmailV = [BindEmailView new];
//    
//    [self.view addSubview:bindEmailV];
//    
//    [bindEmailV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
    
    NetWork *net = [NetWork new];
//    获取token
    [net PostDataWithUri:@"api/atz/apploginauth/token" params:@{@"username":@"admin", @"password":@"123456"} handler:^(NSDictionary *json) {
        
        NSLog(@"%@", json);
        
        if ([json[@"errcode"] intValue] == 0) {
            [Token saveToken:json[@"access_token"]];
            
            [self requestData];
        } else {
            [UIAlertController alertWithMsg:@"token获取失败"];
        }
    }];
    
//    [self requestData];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.paintMainV.topCollectionView]) {
        self.productId = _productArray[indexPath.row].id;
        [self requestData];
    }
    else if ([collectionView isEqual:self.paintMainV.bottomLeftCollectionView]) {
        self.colorId = _colorArray[indexPath.row].id;
        [self requestData];
    }
    else {
        
        PaintListModel *model = self.listArray[indexPath.row];
        
//        if (indexPath.row == 0) {
//        if (self.colorId == 0) {
//            PaintEffectController *质感涂料 = [PaintEffectController new];
//        
//            [self.navigationController pushViewController:质感涂料 animated:YES];
//        }
//        else {
            PaintColorPictureController *珍珠贝彩 = [PaintColorPictureController new];
        珍珠贝彩.colorId = model.colorId;
        珍珠贝彩.typeId = model.typeId;
        珍珠贝彩.productId = model.id;
            [self.navigationController pushViewController:珍珠贝彩 animated:YES];
//        }
    }
    
//    if (indexPath.row == 0) {
//        PaintColorPictureController *珍珠贝彩 = [PaintColorPictureController new];
//        
//        [self.navigationController pushViewController:珍珠贝彩 animated:YES];
//    }
//    else {
//        PaintEffectController *质感涂料 = [PaintEffectController new];
//        
//        [self.navigationController pushViewController:质感涂料 animated:YES];
//    }
}

-(void)requestData {
    NetWork *net = [NetWork new];
    [net PostDataWithUri:@"api/atz/productcolor/TexturedPaint" params:@{@"colorId":@(self.colorId), @"typeId":@(self.productId)} handler:^(NSDictionary *json) {
        
        NSLog(@"%@", json);
        
        _productArray = [PaintProductModel mj_objectArrayWithKeyValuesArray:json[@"producttypelist"]];
        
        _colorArray = [PaintColorModel mj_objectArrayWithKeyValuesArray:json[@"colorlist"]];
        
        _listArray = [PaintListModel mj_objectArrayWithKeyValuesArray:json[@"productlist"]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.paintMainV setContentDataWithProductArr:_productArray colorArr:_colorArray listArr:_listArray];
        });
    }];
}

@end

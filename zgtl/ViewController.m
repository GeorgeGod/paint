//
//  ViewController.m
//  zgtl
//
//  Created by admin on 2017/8/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "PaintEffectCollectionCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *tlCollectionView; //top left CollectionView
@property (nonatomic, strong) UICollectionView *btCollectionView; //bottom CollectionView
@property (nonatomic, strong) UIImageView *trImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *colleBtn; //收藏按钮
@property (nonatomic, strong) UIButton *shareBtn; //分享按钮
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //基本的框架结构
    UIView *tlv = [UIView new];
    tlv.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:tlv];
    
    UIView *trv = [UIView new];
    trv.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:trv];
    
    UIView *bv = [UIView new];
    bv.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bv];
    
    [tlv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(tlv.superview);
        make.bottom.equalTo(bv.mas_top);
        make.width.mas_equalTo(bv.superview).multipliedBy(0.25);
    }];
    [trv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tlv.mas_right);
        make.top.right.equalTo(trv.superview);
        make.bottom.equalTo(bv.mas_top);
    }];
    [bv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(bv.superview);
        make.height.mas_equalTo(bv.superview).multipliedBy(0.33);
    }];
    
    
    //左上角的collectionView
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(150, 100);
    layout.minimumLineSpacing = 10;
    self.tlCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.tlCollectionView registerClass:[PaintEffectCollectionCell class] forCellWithReuseIdentifier:@"PaintEffectCollectionCell"];
    self.tlCollectionView.delegate = self;
    self.tlCollectionView.dataSource = self;
    self.tlCollectionView.backgroundColor = [UIColor clearColor];
    [tlv addSubview:self.tlCollectionView];
    [self.tlCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(tlv);
    }];
    
    
    //右上角的图片和标题
    self.trImageView = [UIImageView new];
    self.trImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.trImageView.clipsToBounds = YES;
    self.trImageView.backgroundColor = [UIColor greenColor];
    [trv addSubview:self.trImageView];
    [self.trImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(trv).insets(UIEdgeInsetsMake(0, 0, 40, 0));
    }];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"NC5-001 客厅";
    [trv addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(trv).offset(20);
        make.top.equalTo(self.trImageView.mas_bottom);
        make.bottom.equalTo(trv);
    }];
    
    //分享
    self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shareBtn.backgroundColor = [UIColor purpleColor];
    [trv addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(trv).offset(-20);
        make.centerY.equalTo(self.titleLabel);
        make.width.mas_equalTo(40);
    }];
    //收藏
    self.colleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.colleBtn.backgroundColor = [UIColor purpleColor];
    [trv addSubview:self.colleBtn];
    [self.colleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).offset(-20);
        make.centerY.equalTo(self.titleLabel);
        make.width.mas_equalTo(40);
    }];
    
    
    //下边的描述
    UILabel *h1 = [UILabel new];
    h1.text = @"预览颜色";
    h1.textColor = [UIColor darkTextColor];
    h1.font = [UIFont fontWithName:nil size:17];
    [bv addSubview:h1];
    [h1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(40);
        make.height.mas_equalTo(17);
    }];
    
    UILabel *p = [UILabel new];
    p.text = @"在选中的房间中预览你选的材质";
    p.numberOfLines = 2;
    p.textColor = [UIColor yellowColor];
    p.font = [UIFont fontWithName:nil size:14];
    [bv addSubview:p];
    [p mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(h1);
        make.top.equalTo(h1.mas_bottom).offset(6);
        make.width.mas_equalTo(100);
    }];
    
    
    //下边的collectionView
    layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(150, 100);
    layout.minimumInteritemSpacing = 10;
    self.btCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.btCollectionView registerClass:[PaintEffectCollectionCell class] forCellWithReuseIdentifier:@"PaintEffectCollectionCell2"];
    self.btCollectionView.delegate = self;
    self.btCollectionView.dataSource = self;
    self.btCollectionView.backgroundColor = [UIColor clearColor];
    [bv addSubview:self.btCollectionView];
    [self.btCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bv).insets(UIEdgeInsetsMake(0, 150, 0, 0));
    }];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.tlCollectionView]) {
        
        PaintEffectCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintEffectCollectionCell" forIndexPath:indexPath];
        
        
        return cell;
    }
    else if ([collectionView isEqual:self.btCollectionView]) {
        
        PaintEffectCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PaintEffectCollectionCell2" forIndexPath:indexPath];
        
        return cell;
        
    }
    return nil;
}

@end

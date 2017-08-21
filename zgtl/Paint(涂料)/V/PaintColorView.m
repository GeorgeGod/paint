//
//  PaintColorView.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PaintColorView.h"
#import "ZBEffectCollectionCell.h"
#import "ZBColorCollectionCell.h"

@interface PaintColorView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *tlCollectionView; //top left CollectionView
@property (nonatomic, strong) UICollectionView *btCollectionView; //bottom CollectionView
@property (nonatomic, strong) UIImageView *trImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *colleBtn; //收藏按钮
@property (nonatomic, strong) UIButton *shareBtn; //分享按钮

@end
@implementation PaintColorView


-(instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"zgtlBg"]];
        
        [self addSubView];
    }
    return self;
}

-(void)addSubView {
    //基本的框架结构
    UIView *tlv = [UIView new];
    tlv.clipsToBounds = YES;
    [self addSubview:tlv];
    
    UIView *trv = [UIView new];
    trv.clipsToBounds = YES;
    [self addSubview:trv];
    
    UIView *bv = [UIView new];
    bv.clipsToBounds = YES;
    [self addSubview:bv];
    
    [tlv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(tlv.superview);
        make.bottom.equalTo(bv.mas_top);
        make.width.mas_equalTo(bv.superview).multipliedBy(0.33);
    }];
    [trv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tlv.mas_right);
        make.top.right.equalTo(trv.superview);
        make.bottom.equalTo(bv.mas_top);
    }];
    [bv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(bv.superview);
        make.height.mas_equalTo(bv.superview).multipliedBy(0.29);
    }];
    
    
    //左上角的collectionView
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(145, 145);
    layout.sectionInset = UIEdgeInsetsMake(18, 18, 18, 18);
    self.tlCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.tlCollectionView registerClass:[ZBEffectCollectionCell class] forCellWithReuseIdentifier:@"ZBEffectCollectionCell"];
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
    self.trImageView.backgroundColor = [UIColor lightGrayColor];
    [trv addSubview:self.trImageView];
    [self.trImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(trv).insets(UIEdgeInsetsMake(0, 0, 40, 0));
    }];
    //修改预览图片
    self.trImageView.image = [UIImage imageNamed:@"effect"];
    
    
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
    [self.shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [trv addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(trv).offset(-15);
        make.centerY.equalTo(self.titleLabel);
        make.width.mas_equalTo(45);
    }];
    //收藏
    self.colleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.colleBtn setImage:[UIImage imageNamed:@"collection"] forState:UIControlStateNormal];
    [trv addSubview:self.colleBtn];
    [self.colleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).offset(-15);
        make.centerY.equalTo(self.titleLabel);
        make.width.mas_equalTo(45);
    }];
    
    
    //下边的描述
    UILabel *h1 = [UILabel new];
    h1.text = @"预览颜色";
    h1.textColor = [UIColor darkTextColor];
    h1.font = [UIFont fontWithName:nil size:20];
    [bv addSubview:h1];
    [h1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(34);
        make.top.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *p = [UILabel new];
    p.text = @"在选中的房间中预览你选的材质";
    p.numberOfLines = 2;
    p.textColor = [UIColor colorwithHex:@"A1A1A1"];
    p.font = [UIFont fontWithName:nil size:18];
    [bv addSubview:p];
    [p mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(h1);
        make.top.equalTo(h1.mas_bottom).offset(18);
        make.width.mas_equalTo(160);
    }];
    
    
    //下边的collectionView
    layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(158, 192);
    layout.minimumInteritemSpacing = 10;
    self.btCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.btCollectionView registerClass:[ZBColorCollectionCell class] forCellWithReuseIdentifier:@"ZBColorCollectionCell"];
    self.btCollectionView.delegate = self;
    self.btCollectionView.dataSource = self;
    self.btCollectionView.backgroundColor = [UIColor clearColor];
    [bv addSubview:self.btCollectionView];
    [self.btCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bv).insets(UIEdgeInsetsMake(0, 220, 0, 0)); //左侧空出220pt
    }];
    
    
    
    //设置阴影部分
    //为透明度设置渐变效果
    UIColor *colorOne = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:0.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    //设置开始和结束位置(设置渐变的方向)
    gradient.startPoint = CGPointMake(1, 0);
    gradient.endPoint = CGPointMake(0, 0);
    gradient.colors = colors;
    gradient.frame = CGRectMake(310, 0, 20, 1000);
    [tlv.layer insertSublayer:gradient atIndex:10];
    
    
    
    //为透明度设置渐变效果
    colorOne = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:1.0];
    colorTwo = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:0.0];
    colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    gradient = [CAGradientLayer layer];
    //设置开始和结束位置(设置渐变的方向)
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    gradient.colors = colors;
    gradient.frame = CGRectMake(0, 0, 1024, 20);
    [bv.layer insertSublayer:gradient atIndex:10];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.tlCollectionView]) {
        
        ZBEffectCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZBEffectCollectionCell" forIndexPath:indexPath];
        
        if (indexPath.row % 2 == 0) {
            cell.imageView.image = [UIImage imageWithColor:[UIColor colorwithHex:@"EB6100"]];
        }
        else {
            cell.imageView.image = [UIImage imageWithColor:[UIColor colorwithHex:@"FF0000"]];
        }
        
        return cell;
    }
    else if ([collectionView isEqual:self.btCollectionView]) {
        
        ZBColorCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZBColorCollectionCell" forIndexPath:indexPath];
        
        cell.imageView.image = [UIImage imageNamed:@"pic2"];
        
        return cell;
        
    }
    return nil;
}


@end

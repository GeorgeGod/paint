//
//  PaintMainView.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/17.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "PaintMainView.h"
#import "PaintTopCollectionCell.h"
#import "PaintBottomLeftCollectionCell.h"

#import "PaintProductModel.h"
#import "PaintColorModel.h"
#import "PaintListModel.h"

@interface PaintMainView ()<UICollectionViewDelegate, UICollectionViewDataSource>

//全部产品按钮
@property (nonatomic, strong) UIButton *allProductBtn;
//全部颜色按钮
@property (nonatomic, strong) UIButton *allColorBtn;

//@property (nonatomic, strong) NSArray *productArray;
//@property (nonatomic, strong) NSArray *colorArray;
//@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) NSArray<PaintProductModel *> *productArray;
@property (nonatomic, strong) NSArray<PaintColorModel *> *colorArray;
@property (nonatomic, strong) NSArray<PaintListModel *> *listArray;

@end

@implementation PaintMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)init {
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        
        [self addSubView];
    }
    return self;
}

-(UIButton *)createButtonWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:nil size:16];
    [btn setBackgroundColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:234/255.0 alpha:1]];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [self addSubview:btn];
    return btn;
}

-(void)addSubView {
    
    self.allProductBtn = [self createButtonWithTitle:@"全部产品"];
    self.allColorBtn = [self createButtonWithTitle:@"全部颜色"];
    [self.allProductBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(66, 30));
    }];
    [self.allColorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.top.equalTo(self.allProductBtn.mas_bottom).offset(4);
        make.size.mas_equalTo(CGSizeMake(66, 30));
    }];
    
    
    UIView *topContentView = [UIView new];
    UIView *blfContentView = [UIView new];
    UIView *brtContentView = [UIView new];
    
    [self addSubview:topContentView];
    [self addSubview:blfContentView];
    [self addSubview:brtContentView];
    
    
    [topContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 112, 0, 20));
        make.height.equalTo(@88);
    }];
    [blfContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topContentView.mas_bottom);
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.width.mas_equalTo(@112);
    }];
    [brtContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(blfContentView.mas_right);
        make.top.equalTo(topContentView.mas_bottom);
        make.right.equalTo(self.mas_right).offset(-20);
        make.bottom.equalTo(self);
    }];
    
    
    self.topCollectionView = [self createTopCollection];
    self.bottomLeftCollectionView = [self createBottomLeftCollection];
    self.bottomRightCollectionView = [self createBottomRightCollection];

    
    [topContentView addSubview:self.topCollectionView];
    [blfContentView addSubview:self.bottomLeftCollectionView];
    [brtContentView addSubview:self.bottomRightCollectionView];
    
    
    [self.topCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(topContentView);
    }];
    [self.bottomLeftCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(blfContentView);
    }];
    [self.bottomRightCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(brtContentView);
    }];
    
    
    //为透明度设置渐变效果
    UIColor *colorOne = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:0.0];
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    //设置开始和结束位置(设置渐变的方向)
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    gradient.colors = colors;
    gradient.frame = CGRectMake(0, 0, 1000, 20);
    [brtContentView.layer insertSublayer:gradient atIndex:10];
    
    //为透明度设置渐变效果
    colorOne = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:1.0];
    colorTwo = [UIColor colorWithRed:(163/255.0)  green:(163/255.0)  blue:(163/255.0)  alpha:0.0];
    colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    gradient = [CAGradientLayer layer];
    //设置开始和结束位置(设置渐变的方向)
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    gradient.colors = colors;
    gradient.frame = CGRectMake(0, 0, 20, 1000);
    [brtContentView.layer insertSublayer:gradient atIndex:10];
    
}

-(UICollectionView *)createTopCollection {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    UICollectionView *col = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    col.delegate = self;
    col.dataSource = self;
    col.backgroundColor = [UIColor clearColor];
    col.alwaysBounceHorizontal = YES;
    [col registerClass:[PaintTopCollectionCell class] forCellWithReuseIdentifier:@"topCellID"];
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(152, 88);
    
    
    return col;
}

-(UICollectionView *)createBottomLeftCollection {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    UICollectionView *col = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    col.delegate = self;
    col.dataSource = self;
    col.backgroundColor = [UIColor clearColor];
//    col.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    col.alwaysBounceVertical = YES;
    [col registerClass:[PaintBottomLeftCollectionCell class] forCellWithReuseIdentifier:@"bLeftCellID"];
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(110, 66);
//    layout.minimumLineSpacing = 20;
//    layout.minimumInteritemSpacing = 10;
    
    return col;
}

-(UICollectionView *)createBottomRightCollection {
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    UICollectionView *col = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    col.delegate = self;
    col.dataSource = self;
    col.backgroundColor = [UIColor clearColor];
//    col.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    col.alwaysBounceVertical = YES;
    [col registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"bRightCellID"];
    col.layer.shadowOffset = CGSizeMake(5, 5);
    col.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    col.layer.shadowOpacity = 0.8;
    
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(114, 114);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(32, 34, 32, 34);
    
    
    
//    //为透明度设置渐变效果
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 20)];
//    UIColor *colorOne = [UIColor colorWithRed:(216/255.0)  green:(0/255.0)  blue:(18/255.0)  alpha:1.0];
//    UIColor *colorTwo = [UIColor colorWithRed:(216/255.0)  green:(0/255.0)  blue:(18/255.0)  alpha:0.0];
//    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    //设置开始和结束位置(设置渐变的方向)
//    gradient.startPoint = CGPointMake(0, 0);
//    gradient.endPoint = CGPointMake(0, 1);
//    gradient.colors = colors;
//    gradient.frame = CGRectMake(0, 0, 1000, 20);
//    [view.layer insertSublayer:gradient atIndex:0];
//    [col addSubview:view];
    
    return col;
}



// 代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([collectionView isEqual:self.topCollectionView]) {
        return self.productArray.count;
    }
    else if ([collectionView isEqual:self.bottomLeftCollectionView]) {
        return self.colorArray.count;
    }
    else {
        return self.listArray.count;
    }
}
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 1;
//}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([collectionView isEqual:self.topCollectionView]) {
        PaintTopCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCellID" forIndexPath:indexPath];
        
        
        PaintProductModel *model = self.productArray[indexPath.row];
        NSURL *url = [NSURL URLWithString:[BaseUrl stringByAppendingFormat:@"%@", model.url]];
        [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"logo1"]];
        
        return cell;
        
    }
    else if ([collectionView isEqual:self.bottomLeftCollectionView]) {
        
        PaintBottomLeftCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bLeftCellID" forIndexPath:indexPath];
        
        
        PaintColorModel *model = self.colorArray[indexPath.row];
        
        NSURL *url = [NSURL URLWithString:[BaseUrl stringByAppendingFormat:@"%@", model.url]];
        [cell.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"logo1"]];
        
        return cell;
        
    }
    else {
        
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bRightCellID" forIndexPath:indexPath];
        
        cell.backgroundColor = randomColor();
        
        return cell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:227/255.0 alpha:1];
    
    
    [self.delegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
}



//设置数据
-(void)setContentDataWithProductArr:(NSArray *)productArr colorArr:(NSArray *)colorArr listArr:(NSArray *)listArr {
    
    self.productArray = productArr;
    self.colorArray = colorArr;
    self.listArray = listArr;
    
    [self.topCollectionView reloadData];
    [self.bottomLeftCollectionView reloadData];
    [self.bottomRightCollectionView reloadData];
}


@end

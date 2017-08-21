//
//  PaintMainView.h
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/17.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PaintMainDelegate <NSObject>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface PaintMainView : UIView

@property (nonatomic, weak) id<PaintMainDelegate>delegate;

@end

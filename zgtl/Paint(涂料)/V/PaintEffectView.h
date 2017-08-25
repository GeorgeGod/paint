//
//  PaintEffectView.h
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//  质感涂料

#import <UIKit/UIKit.h>
#import "PaintMainView.h"

@interface PaintEffectView : UIView


@property (nonatomic, weak ) id<PaintMainDelegate>delegate;

-(void)setContentDataWithPaintArr:(NSArray *)paintArr bigPicArr:(NSArray *)bigPicArr perviewArr:(NSArray *)perviewArr;


@end

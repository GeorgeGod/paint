//
//  PaintColorView.h
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/21.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaintMainView.h"


@interface PaintColorView : UIView

@property (nonatomic, weak ) id<PaintMainDelegate>delegate;


-(void)setContentDataWithColorArr:(NSArray *)colorArr bigPicArr:(NSArray *)bigPicArr perviewArr:(NSArray *)perviewArr;


@end

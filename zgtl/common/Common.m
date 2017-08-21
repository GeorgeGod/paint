//
//  Common.m
//  zgtl
//
//  Created by 虞嘉伟 on 2017/8/17.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "Common.h"

@implementation Common

UIColor *randomColor() {
    
    CGFloat r = arc4random_uniform(255)/255.0;
    CGFloat g = arc4random_uniform(255)/255.0;
    CGFloat b = arc4random_uniform(255)/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end

//
//  UIAlertController+msg.m
//  zgtl
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "UIAlertController+msg.h"

@implementation UIAlertController (msg)


+(void)alertWithMsg:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //不作处理
        
    }];
    [alert addAction:action];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end

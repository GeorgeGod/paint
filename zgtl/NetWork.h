//
//  NetWork.h
//  zgtl
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWork : NSObject

//GET请求
-(void)GetDataWithUri:(NSString *)uri params:(NSDictionary *)params handler:(void(^)(NSDictionary *json))handler;

//POST请求
-(void)PostDataWithUri:(NSString *)uri params:(NSDictionary *)params handler:(void(^)(NSDictionary *json))handler;

@end

//
//  NetWork.m
//  zgtl
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NetWork.h"
//#define BaseUrl @"http://doveatz.idea-source.net/"
//#define TOKEN [[NSUserDefaults standardUserDefaults] objectForKey:@"token"]

@implementation NetWork


//GET请求
-(void)GetDataWithUri:(NSString *)uri params:(NSDictionary *)params handler:(void(^)(NSDictionary *json))handler {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@""]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"已经获取到数据\n正在解析...");
        
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSLog(@"解析成功");
            
            handler(dic);
            
        } else {
            NSLog(@"获取的数据不正确");
            
            handler(nil);
        }
    }];
    
    [task resume];
}

//POST请求
-(void)PostDataWithUri:(NSString *)uri params:(NSDictionary *)params handler:(void(^)(NSDictionary *json))handler {
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", BaseUrl, uri];
    
    NSString *token = [Token fetchToken];
    if (token) {
        urlStr = [urlStr stringByAppendingFormat:@"?token=%@", token];
    }
    
    // 1.创建一个网络路径
    NSURL *url = [NSURL URLWithString:urlStr];
    // 2.创建一个网络请求，分别设置请求方法、请求参数
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    if (params) {
        
        NSArray *allKeys = [params allKeys];
        NSMutableArray *values = [NSMutableArray array];
        
        for (NSString *key in allKeys) {
            NSString *kv = [NSString stringWithFormat:@"%@=%@", key, params[key]];
            [values addObject:kv];
        }
        NSString *args = [values componentsJoinedByString:@"&"];
        request.HTTPBody = [args dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    // 3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.根据会话对象，创建一个Task任务
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"从服务器获取到数据");
        /*
         对从服务器获取到的数据data进行相应的处理.
         */
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            NSLog(@"解析成功: %@", dic);
            
            handler(dic);
            
        } else {
            NSLog(@"获取的数据不正确");
            
            handler(nil);
        }
    }];
    //5.最后一步，执行任务，(resume也是继续执行)。
    [sessionDataTask resume];
}

@end

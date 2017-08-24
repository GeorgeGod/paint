//
//  Token.h
//  zgtl
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Token : NSObject

@property (nonatomic, copy) NSString *expires; //过期时间
@property (nonatomic, copy) NSString *access_token; //token值

+(void)saveToken:(NSString *)token;
+(NSString *)fetchToken;

@end

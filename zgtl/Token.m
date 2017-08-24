//
//  Token.m
//  zgtl
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "Token.h"

@implementation Token


+(void)saveToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"kAccessToken"];
}
+(NSString *)fetchToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"kAccessToken"];
}

@end

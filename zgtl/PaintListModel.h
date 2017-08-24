//
//  PaintListModel.h
//  zgtl
//
//  Created by admin on 2017/8/24.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaintListModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger typeId;
@property (nonatomic, assign) NSInteger colorId;
@property (nonatomic, copy  ) NSString *mainTitle;
@property (nonatomic, copy  ) NSString *url;


@end

//
//  PaintEffectModel.h
//  zgtl
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface PaintEffectModel : NSObject
//
//@end



/**
 下方效果图集合
 */
@interface EffectSceneModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy  ) NSString *mainTitle;
@property (nonatomic, copy  ) NSString *url;

@end



/**
 左侧的涂料颜色集合
 */
@interface EffectPaintModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger typeId;
@property (nonatomic, assign) NSInteger colorId;
@property (nonatomic, copy  ) NSString *mainTitle;
@property (nonatomic, copy  ) NSString *url;

@end




/**
 右侧的大图集合
 */
@interface EffectBigPicModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy  ) NSString *type;
@property (nonatomic, copy  ) NSString *mainTitle;
@property (nonatomic, copy  ) NSString *url;

@end

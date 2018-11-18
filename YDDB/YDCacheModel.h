//
//  YDCacheModel.h
//  YDDB
//
//  Created by Wei Zhang on 2018/11/6.
//  Copyright © 2018 Wei Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YDDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface YDItemModel : NSObject

@end

@interface YDCacheModel : NSObject

@property (assign, nonatomic) double y;
@property (assign, nonatomic) float a;
@property (assign, nonatomic) int b;
@property (assign, nonatomic) unsigned int c;
@property (assign, nonatomic) BOOL d;
@property (assign, nonatomic) NSInteger e;
@property (assign, nonatomic) NSTimeInterval f;

@property (copy, nonatomic) NSString *gg;
@property (strong, nonatomic) NSData *data;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSNumber *number;


@property (strong, nonatomic) YDItemModel *itemModel;


@end

NS_ASSUME_NONNULL_END

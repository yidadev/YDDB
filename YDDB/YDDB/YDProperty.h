//
//  YDProperty.h
//  YDDB
//
//  Created by Wei Zhang on 2018/11/6.
//  Copyright © 2018 Wei Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger,YDPropertyType) {
    YDPropertyTypeUndefined,
    YDPropertyTypeInteger,
    YDPropertyTypeFloat,
    YDPropertyTypeString,
    YDPropertyTypeBoolean,
    YDPropertyTypeDate,
    YDPropertyTypeData,
    YDPropertyTypeTransformable
};

#define SQLTEXT     @"TEXT"
#define SQLINTEGER  @"INTEGER"
#define SQLREAL     @"REAL"
#define SQLBLOB     @"BLOB"
#define SQLNULL     @"NULL"
#define SQLNOTNULL  @"NOT NULL"
#define SQLDEFAULT  @"DEFAULT"
#define SQLUNIQUE   @"UNIQUE"
#define SQLCHECK    @"CHECK"
#define SQLAUTOINCRE    @"AUTOINCREMENT"
#define SQLPRIMARYKEY   @"PRIMARY KEY"
#define SQLFOREIGNKEY   @"FOREIGN KEY"

#define ZanRowIDKey  @"Zan_RowID"


//解析这个类型的存储：
@interface YDProperty : NSObject

@property (assign, nonatomic) BOOL isPrimaryKey;
@property (assign, nonatomic) BOOL isUnique;
@property (assign, nonatomic) BOOL isNotNull;
@property (assign, nonatomic) BOOL isTransient;
@property (assign, nonatomic) BOOL isIndex;

@property (copy, nonatomic) id defaultValue;

@property (copy, nonatomic) NSString *propertyName;
@property (copy, nonatomic) NSString *propertyTypeStr;

//存储的colomnName
@property (copy, nonatomic) NSString *colomnName;
@property (copy, nonatomic) NSString *colomnTypeStr;


- (instancetype)initWithProperty:(objc_property_t)property;

@end

NS_ASSUME_NONNULL_END

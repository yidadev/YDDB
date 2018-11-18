//
//  NSObject+YDDB.m
//  YDDB
//
//  Created by Wei Zhang on 2018/11/6.
//  Copyright © 2018 Wei Zhang. All rights reserved.
//

#import "NSObject+YDDB.h"
#import <objc/runtime.h>
#import "YDProperty.h"

@implementation NSObject (YDDB)

- (void)prepareForCacheToDB {
    unsigned int count = 0;
    NSMutableArray *ydPropertyList = [[NSMutableArray alloc] init];
    objc_property_t *properties =  class_copyPropertyList([self class], &count);
    for (NSInteger index = 0 ; index < count; index++) {
        objc_property_t property = properties[index];
        YDProperty *ydProperty = [[YDProperty alloc] initWithProperty:property];
        [ydPropertyList addObject:ydProperty];
    }
}

@end

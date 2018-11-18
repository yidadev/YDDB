//
//  YDProperty.m
//  YDDB
//
//  Created by Wei Zhang on 2018/11/6.
//  Copyright © 2018 Wei Zhang. All rights reserved.
//

#import "YDProperty.h"
#import <objc/runtime.h>

@implementation YDProperty

- (instancetype)initWithProperty:(objc_property_t)property {
    self = [super init];
    if (self) {
        //判断类型
        [self parseProperty:property];
    }
    return self;
}


- (void)parseProperty:(objc_property_t)property {
    
    NSString *name = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
    NSString *attribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
    NSLog(@"不同的类型转化 %@   %@ ", name, attribute);
    
    NSString *typeStr = nil;
    //判断是根据对象指令来进行分析的
    if ([attribute hasPrefix:@"T@"]) {
        //存储的是对象
        NSArray *substrings = [attribute componentsSeparatedByString:@"\""];
        if (substrings.count > 1) {
            //提示内容显示的部分，
            typeStr = [substrings objectAtIndex:1];
            //判断其他情况：
        }
    } else if([attribute hasPrefix:@"Td"]) {
        typeStr = @"double";
    } else if([attribute hasPrefix:@"Tf"]) {
        typeStr = @"float";
    } else if([attribute hasPrefix:@"TI"]) {
        typeStr = @"unsigned int";
    } else if([attribute hasPrefix:@"TB"]) {
        typeStr = @"BOOL";
    } else if([attribute hasPrefix:@"Tq"]) {
        typeStr = @"NSInteger";
    } else if([attribute hasPrefix:@"Tl"]) {
        typeStr = @"long";
    } else {
        //undefine的类型
        typeStr = nil;
    }
    YDPropertyType type = [self transPropertyFrom:typeStr];
    //根据这几种类型，来判断type的类型
    
}


- (YDPropertyType)transPropertyFrom:(NSString *)typeStr {
    if ([@"int" isEqualToString:typeStr] ||
        [@"unsigned" isEqualToString:typeStr] ||
        [@"short" isEqualToString:typeStr] ||
        [@"long" isEqualToString:typeStr] ||
        [@"unsigned long" isEqualToString:typeStr] ||
        [@"long long" isEqualToString:typeStr] ||
        [@"unsigned long long" isEqualToString:typeStr] ||
        [@"char" isEqualToString:typeStr]) {
        return YDPropertyTypeInteger;
    } else if ([@"float" isEqualToString:typeStr] ||
               [@"double" isEqualToString:typeStr]) {
        return YDPropertyTypeFloat;
    } else if ([@"NSString" isEqualToString:typeStr] ||
               [@"NSMutableString" isEqualToString:typeStr]) {
        return YDPropertyTypeString;
    } else if ([@"bool" isEqualToString:typeStr]) {
        return YDPropertyTypeBoolean;
    } else if ([@"NSDate" isEqualToString:typeStr]) {
        return YDPropertyTypeDate;
    } else if ([@"NSData" isEqualToString:typeStr] ||
               [@"NSMutableData" isEqualToString:typeStr]) {
        return YDPropertyTypeData;
    } else {
        Class propertyClass = NSClassFromString(typeStr);
        if ([propertyClass isSubclassOfClass:NSDecimalNumber.class]) {
            return YDPropertyTypeFloat;
        } else if ([propertyClass isSubclassOfClass:NSNumber.class]) {
            return YDPropertyTypeInteger;
        } else {
            return YDPropertyTypeUndefined;
        }
    }
}


@end

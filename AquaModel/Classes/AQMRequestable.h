//
//  AQMRequestable.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AQMRequestType) {
    AQMRequestTypeShow,
    AQMRequestTypeCreate,
    AQMRequestTypeUpdate,
    AQMRequestTypeDestroy
};

typedef NS_ENUM(NSUInteger, AQMRequestMethod) {
    AQMRequestMethodGET,
    AQMRequestMethodPOST,
    AQMRequestMethodPATCH,
    AQMRequestMethodPUT,
    AQMRequestMethodDELETE
};

@protocol AQMRequestable <NSObject>

@required

+ (NSString *)identifierKey;

//@example
//return @"/albums";
+ (NSString *)resourceBasePath;

//@example Rails routing
//```
//return @{
//    @(AQMRequestTypeShow): @[@(AQMRequestMethodGET), @"/:id"],
//    @(AQMRequestTypeCreate): @[@(AQMRequestMethodPOST), @"/"],
//    @(AQMRequestTypeUpdate): @[@(AQMRequestMethodPATCH), @"/:id"],
//    @(AQMRequestTypeDestroy): @[@(AQMRequestMethodDELETE), @"/:id"]
//};
//```
+ (NSDictionary *)resourceMap;

@end

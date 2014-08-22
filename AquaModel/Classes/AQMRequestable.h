//
//  AQMRequestable.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AQMResuestType) {
    AQMResuestTypeShow,
    AQMResuestTypeCreate,
    AQMResuestTypeUpdate,
    AQMResuestTypeDestroy
};

typedef NS_ENUM(NSUInteger, AQMRequestMethod) {
    AQMResuestMethodGET,
    AQMResuestMethodPOST,
    AQMRequestMethodPATCH,
    AQMRequestMethodPUT,
    AQMRequestMethodDELETE
};

@protocol AQMRequestable <NSObject>

//@example
//return @"/albums";
+ (NSString *)resourceBasePath;

//@example Rails routing
//```
//return @{
//    AQMRequestTypeShow: @[AQMResuestMethodGET, @"/:id"],
//    AQMRequestTypeCreate: @[AQMResuestMethodPOST, @"/"],
//    AQMRequestTypeUpdate: @[AQMRequestMethodPATCH, @"/:id"],
//    AQMRequestTypeDestroy: @[AQMRequestMethodDELETE, @"/:id"]
//};
//```
+ (NSDictionary *)resourceMap;

@end

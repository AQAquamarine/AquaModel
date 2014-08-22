//
//  AQMModel.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"

@implementation AQMModel

#pragma mark - Requestable

+ (void)fetch:(NSUInteger)identifier {
    // TODO
}

- (void)fetch {
    // TODO
}

- (void)push {
    // TODO
}

#pragma mark - AQMRequestable

+ (NSString *)resourceBasePath {
    return [NSStringFromClass(self) lowercaseString]; // TODO: plularize
}

+ (NSDictionary *)resourceMap {
    return @{
        @(AQMRequestTypeShow): @[@(AQMRequestMethodGET), @"/:id"],
        @(AQMRequestTypeCreate): @[@(AQMRequestMethodPOST), @"/"],
        @(AQMRequestTypeUpdate): @[@(AQMRequestMethodPATCH), @"/:id"],
        @(AQMRequestTypeDestroy): @[@(AQMRequestMethodDELETE), @"/:id"]
    };
}

#pragma mark - Validatable

#pragma mark - Callbackable

#pragma mark - JSONSeriarizable

@end

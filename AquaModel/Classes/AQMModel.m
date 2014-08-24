//
//  AQMModel.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"

@implementation AQMModel

@synthesize entity;

- (instancetype)init {
    self = [super init];
    if (self) {
        [self afterCreate];
    }
    return self;
}

# pragma mark - Requestable

// Please override the method.
- (NSString *)identifier {
    return @"";
}

+ (void)fetch:(NSUInteger)identifier {
    // TODO
}

- (void)fetch {
    // TODO
}

- (void)push {
    // TODO
}

# pragma mark - AQMRequestable

// Please override the method.
+ (NSString *)resourceBasePath {
    return [NSStringFromClass(self) lowercaseString]; // TODO: plularize
}

// Please override the method.
+ (NSDictionary *)resourceMap {
    return @{
        @(AQMRequestTypeShow): @[@(AQMRequestMethodGET), @"/:id"],
        @(AQMRequestTypeCreate): @[@(AQMRequestMethodPOST), @"/"],
        @(AQMRequestTypeUpdate): @[@(AQMRequestMethodPATCH), @"/:id"],
        @(AQMRequestTypeDestroy): @[@(AQMRequestMethodDELETE), @"/:id"]
    };
}

# pragma mark - NSManagedObject

// Please override the method.
+ (NSString *)managedObjectEntityName {
    return @"";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

# pragma mark - JSONSerialization

// Please override the mtheod.
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

@end

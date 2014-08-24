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

// PLEASE OVERRIDE THE METHOD!
+ (NSString *)identifierKey {
    NSLog(@"You should override the method %@", @"-identifier");
    return @"identifier";
}

# pragma mark - AQMRequestable

// PLEASE OVERRIDE THE METHOD!
+ (NSString *)resourceBasePath {
    NSLog(@"You should override the mthod %@", @"-resourceBasePath");
    return [NSStringFromClass(self) lowercaseString]; // TODO: plularize
}

// Override the method if needed.
+ (NSDictionary *)resourceMap {
    return @{
        @(AQMRequestTypeShow): @[@(AQMRequestMethodGET), @"/:id"],
        @(AQMRequestTypeCreate): @[@(AQMRequestMethodPOST), @"/"],
        @(AQMRequestTypeUpdate): @[@(AQMRequestMethodPATCH), @"/:id"],
        @(AQMRequestTypeDestroy): @[@(AQMRequestMethodDELETE), @"/:id"]
    };
}

# pragma mark - MTLManagedObjectSerializing

// PLEASE OVERRIDE THE METHOD!
+ (NSString *)managedObjectEntityName {
    NSLog(@"You should override the method %@", @"-managedObjectEntityName");
    return @"";
}

// PLEASE OVERRIDE THE METHOD!
+ (NSDictionary *)managedObjectKeysByPropertyKey {
    NSLog(@"You should override the method %@", @"-managedObjectKeysByPropertyKey");
    return @{};
}

# pragma mark - MTLJSONSerializing

// PLEASE OVERRIDE THE METHOD!
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSLog(@"You should override the method %@", @"-JSONKeyPathsByPropertyKey");
    return @{};
}

@end

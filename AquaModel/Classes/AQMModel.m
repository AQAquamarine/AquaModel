//
//  AQMModel.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"
#import "AQMValueValidator.h"

@implementation AQMModel

# pragma mark - ActiveRecord

+ (instancetype)create {
    return [self new];
}

- (void)update {
    // TODO
}

- (void)destroy {
    // TODO
}

# pragma mark - Validatable

- (BOOL)validate {
    NSDictionary *map = [[self class] validationMap];
    for (NSString *key in map) {
        if ([self validateAttributeWithKey:key] == NO) { return NO; };
    }
    return YES;
}

# pragma mark - Validatable Helpers

- (BOOL)validateAttributeWithKey:(NSString *)key {
    NSArray *validators = [[self class] validationMap][key];
    id attribute = [self valueForKey:key];
    return [self validateAttribute:attribute withValidators:validators];
}

- (BOOL)validateAttribute:(id)attribute withValidators:(NSArray *)validators {
    for (id<AQMValueValidator> validator in validators) {
        if ([validator validate:attribute] == NO) { return NO; }
    }
    return YES;
}

# pragma mark - Requestable

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

# pragma mark - Callbackable

+ (NSArray *)beforeValidation {
    return @[];
}

+ (NSArray *)afterValidation {
    return @[];
}

+ (NSArray *)beforeSave {
    return @[];
}

+ (NSArray *)afterSave {
    return @[];
}

# pragma mark - JSONSeriarizable

@end

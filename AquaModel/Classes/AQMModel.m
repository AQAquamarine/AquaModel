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

- (instancetype)init {
    self = [super init];
    if (self) {
        [self afterCreate];
    }
    return self;
}

# pragma mark - ActiveRecord

+ (instancetype)create {
    return [self new];
}

- (BOOL)update {
    [self beforeValidation];
    if ([self validate] == NO) { return NO; }
    [self afterValidation];
    [self beforeSave];
    // TODO
    [self afterSave];
    return YES;
}

- (BOOL)destroy {
    // TODO
    return NO;
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

# pragma mark - Callbackable

// Please override the method.
- (void)afterCreate {
}

// Please override the method.
- (void)beforeValidation {
}

// Please override the method.
- (void)afterValidation {
}

// Please override the method.
- (void)beforeSave {
}

// Please override the method.
- (void)afterSave {
}

# pragma mark - JSONSeriarizable

@end

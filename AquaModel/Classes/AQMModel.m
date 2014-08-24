//
//  AQMModel.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"
#import "AQMValueValidator.h"
#import <CoreData/CoreData.h>
#import <ObjectiveRecord.h>

@implementation AQMModel

@synthesize entity;

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

- (BOOL)save {
    if ([self validateWithCallbacks] == NO) { return NO; }
    if (self.entity) {
        return [self saveWhenExists];
    } else {
        return [self saveWhenNotExists];
    }
}

- (BOOL)update {
    return [self save];
}

- (BOOL)destroy {
    //TODO
    return YES;
}

# pragma mark - ActiveRecord Helpers

- (BOOL)saveWhenExists {
    [self beforeSave];
    if ([self saveActualEntity] == NO) { return NO; }
    [self afterSave];
    return YES;
}

- (BOOL)saveWhenNotExists {
    [self beforeSave];
    if ([self createNewEntityAndSave] == NO) { return NO; }
    [self afterSave];
    return YES;
}

- (BOOL)createNewEntityAndSave {
    NSManagedObject *newEntity = [self createNewEntity];
    if ([newEntity save] == NO) { return NO; }
    self.entity = newEntity;
    return YES;
}

- (NSManagedObject *)createNewEntity {
    return [MTLManagedObjectAdapter managedObjectFromModel:self insertingIntoContext:[[CoreDataManager sharedManager] managedObjectContext] error:nil];
}

- (BOOL)saveActualEntity {
    return [[self entity] save];
}

# pragma mark - Validatable

- (BOOL)validateWithCallbacks {
    [self beforeValidation];
    if ([self validate] == NO) { return NO; }
    [self afterValidation];
    return YES;
}

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

# pragma mark - NSManagedObject

// Please override the method.
+ (NSString *)managedObjectEntityName {
    return @"";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

# pragma mark - Seriarizable (Public)

// Please override the mtheod.
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary];
}

@end

//
//  AQMModel+ActiveRecord.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel+ActiveRecord.h"
#import <CoreData/CoreData.h>
#import <ObjectiveRecord.h>

#import "AQMModel+Validation.h"

@implementation AQMModel (ActiveRecord)

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
    if (!self.entity) { return NO; }
    [[self entity] delete];
    return YES;
}

+ (instancetype)find:(NSString *)identifier {
    return [[self entityClass] find:identifier];
}

+ (NSArray *)where:(NSString *)query {
    return [[self entityClass] where:query];
}

# pragma mark - Helpers (CoreData)

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

# pragma mark - Helpers

+ (Class)entityClass {
    return NSClassFromString([self managedObjectEntityName]);
}

- (NSString *)identifier {
    NSString *key = [[self class] identifierKey];
    return [[self valueForKey:key] stringValue];
}

@end

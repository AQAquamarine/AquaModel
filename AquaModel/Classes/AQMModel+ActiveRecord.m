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

- (BOOL)saveWithOutSavingCallbacks {
    if ([self validateWithCallbacks] == NO) { return NO; }
    if (self.entity) {
        return [self saveActualEntity];
    } else {
        return [self createNewEntityAndSave];
    }
}

- (BOOL)update {
    return [self save];
}

- (BOOL)destroy {
    if (!self.entity) { return NO; }
    [self hardOrSoftDelete];
    return YES;
}

+ (instancetype)find:(NSString *)identifier {
    NSString *query = [NSString stringWithFormat:@"%@ == %@", [self identifierKey], identifier];
    NSString *scoped = [self scopedQuery:query];
    NSManagedObject *entity = [[self entityClass] find:scoped];
    return [self modelWithManagedObject:entity];
}

+ (NSArray *)where:(NSString *)query {
    NSString *scoped = [self scopedQuery:query];
    NSArray *entities = [[self entityClass] where:scoped];
    return [self modelsWithManagedObjects:entities];
}

# pragma mark - Soft Deletion

- (void)hardOrSoftDelete {
    if ([[self class] softDeletion] == YES) {
        [self softDelete];
    } else {
        [[self entity] delete];
    }
}

- (void)softDelete {
    self.aqm_isDeleted = true;
    [self save];
}

# pragma mark - Helpers (Querying)

+ (NSString *)scopedQuery:(NSString *)query {
    if ([query isEqualToString:@""]) { return query; }
    return [NSString stringWithFormat:@"%@ AND %@", [self scope] ,query];
}

+ (NSString *)scope {
    if ([self softDeletion] == NO) { return [self defaultScope]; }
    return [NSString stringWithFormat:@"aqm_isDeleted == NO AND %@", [self defaultScope]];
}

# pragma mark - Helpers (MTLManagedObjectAdapter)

+ (instancetype)modelWithManagedObject:(NSManagedObject *)entity {
    AQMModel *model = [MTLManagedObjectAdapter modelOfClass:self fromManagedObject:entity error:nil];
    model.entity = entity;
    return model;
}

+ (NSArray *)modelsWithManagedObjects:(NSArray *)entities {
    NSMutableArray *models = [[NSMutableArray alloc] init];
    for (NSManagedObject *entity in entities) {
        [models addObject:[self modelWithManagedObject:entity]];
    }
    return models;
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

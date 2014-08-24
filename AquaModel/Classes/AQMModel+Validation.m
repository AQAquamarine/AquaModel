//
//  AQMModel+Validation.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel+Validation.h"
#import "AQMValueValidator.h"

@implementation AQMModel (Validation)

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

@end

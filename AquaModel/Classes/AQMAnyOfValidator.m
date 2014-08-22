//
//  AQMAnyOfValidator.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMAnyOfValidator.h"

@implementation AQMAnyOfValidator

- (instancetype)initWithSet:(NSSet *)set {
    self = [super init];
    if (self) {
        self.set = set;
    }
    return self;
}

- (BOOL)validate:(id)value {
    if (value == nil) { return NO; }
    return [self.set containsObject:value];
}

@end

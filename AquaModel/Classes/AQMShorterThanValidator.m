//
//  AQMShorterThanValidator.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMShorterThanValidator.h"

@implementation AQMShorterThanValidator

- (instancetype)initWithLength:(NSUInteger)length {
    self = [super init];
    if (self) {
        self.length = length;
    }
    return self;
}

- (BOOL)validate:(id)value {
    if (value == nil) { return NO; }
    NSString *string = value;
    return string.length < self.length;
}

@end

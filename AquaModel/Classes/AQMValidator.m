//
//  AQMValidator.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMValidator.h"
#import "AQMValidators.h"

@implementation AQMValidator

+ (id<AQMValueValidator>)presence {
    return [[AQMPresenceValidator alloc] init];
}

+ (id<AQMValueValidator>)shorterThan:(NSUInteger)length {
    return [[AQMShorterThanValidator alloc] initWithLength:length];
}

+ (id<AQMValueValidator>)longerThan:(NSUInteger)length {
    return [[AQMLongerThanValidator alloc] initWithLength:length];
}

@end

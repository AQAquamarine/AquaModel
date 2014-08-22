//
//  AQMValidator.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMValidator.h"
#import "AQMPresenceValidator.h"

@implementation AQMValidator

+ (id<AQMValueValidator>)presence {
    return [[AQMPresenceValidator alloc] init];
}

@end

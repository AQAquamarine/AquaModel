//
//  AQMPresenceValidator.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMPresenceValidator.h"

@implementation AQMPresenceValidator

- (BOOL)validate:(id)value {
    if (value == nil) {
        return NO;
    } else {
        return YES;
    }
}

@end

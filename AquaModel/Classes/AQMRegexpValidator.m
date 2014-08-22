//
//  AQMRegexpValidator.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMRegexpValidator.h"

@implementation AQMRegexpValidator

- (instancetype)initWithRegexp:(NSRegularExpression *)regexp {
    self = [super init];
    if (self) {
        self.regexp = regexp;
    }
    return self;
}

- (BOOL)validate:(id)value {
    if (value == nil) { return NO; }
    NSString *string = value;
    NSUInteger count = [self.regexp numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
    return count != 0;
}

@end

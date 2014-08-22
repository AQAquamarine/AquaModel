//
//  Dog.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "Dog.h"

@implementation Dog

+ (NSDictionary *)validationMap {
    return @{
        @"name": @[[AQMValidator anyOf:[NSSet setWithArray:@[@"Pochi", @"Tama"]]]]
    };
}

@end

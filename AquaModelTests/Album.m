//
//  Album.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "Album.h"

@implementation Album

+ (NSDictionary *)validationMap {
    return @{
        @"title": @[[AQMValidator presence], [AQMValidator shorterThan:10], [AQMValidator longerThan:3]]
    };
}

@end

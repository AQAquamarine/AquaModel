//
//  AQMModel+Serialization.m
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel+Serialization.h"

@implementation AQMModel (Serialization)

- (NSDictionary *)dictionaryRepresentation {
    return [MTLJSONAdapter JSONDictionaryFromModel:self];
}

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary];
}

@end

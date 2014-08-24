//
//  AQMModel+Serialization.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"

@interface AQMModel (Serialization)

- (NSDictionary *)dictionaryRepresentation;
+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end

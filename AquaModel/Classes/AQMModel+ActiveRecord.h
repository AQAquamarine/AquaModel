//
//  AQMModel+ActiveRecord.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"

@interface AQMModel (ActiveRecord)

+ (instancetype)create;
- (BOOL)save; // Alias of update.
- (BOOL)update;
- (BOOL)destroy;

+ (instancetype)find:(NSString *)identifier;
+ (NSArray *)where:(NSString *)query;

@end

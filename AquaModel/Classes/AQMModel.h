//
//  AQMModel.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <MTLModel.h>
#import "AQMRequestable.h"
#import "AQMValidatable.h"
#import "AQMCallbackable.h"
#import "AQMValidator.h"
#import <MTLJSONAdapter.h>

@interface AQMModel : MTLModel <AQMRequestable, AQMCallbackable, AQMValidatable, MTLJSONSerializing>

# pragma mark - ActiveRecord

+ (instancetype)create;
- (BOOL)update;
- (BOOL)destroy;

# pragma mark - Requestable

# pragma mark - Validatable

# pragma mark - Serializable (Public)

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end

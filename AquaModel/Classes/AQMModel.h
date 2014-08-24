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
#import "AQMQueryable.h"
#import <MTLJSONAdapter.h>
#import <MTLManagedObjectAdapter.h>

#import "AQMValidator.h"

@interface AQMModel : MTLModel <AQMRequestable, AQMCallbackable, AQMValidatable, AQMQueryable, MTLJSONSerializing, MTLManagedObjectSerializing>

@property (nonatomic, retain) NSManagedObject *entity;

@end

#import "AQMModel+ActiveRecord.h"
#import "AQMModel+Validation.h"
#import "AQMModel+Callback.h"
#import "AQMModel+Serialization.h"
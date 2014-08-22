//
//  AQMModel.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "MTLModel.h"
#import "AQMRequestable.h"
#import "AQMValidatable.h"
#import "AQMCallbackable.h"
#import "AQMValidator.h"

@interface AQMModel : MTLModel <AQMRequestable, AQMCallbackable, AQMValidatable>

# pragma mark - Requestable

+ (void)fetch:(NSUInteger)identifier;
- (void)fetch;
- (void)push;

# pragma mark - Validatable

@end

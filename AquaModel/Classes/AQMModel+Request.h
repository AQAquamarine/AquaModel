//
//  AQMModel+Request.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMModel.h"

@interface AQMModel (Request)

+ (void)fetch:(NSUInteger)identifier;
- (void)fetch;
- (void)push;

@end

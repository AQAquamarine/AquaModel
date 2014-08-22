//
//  AQMLongerThanValidator.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQMValueValidator.h"

@interface AQMLongerThanValidator : NSObject <AQMValueValidator>

@property NSUInteger length;

- (instancetype)initWithLength:(NSUInteger)length;

@end

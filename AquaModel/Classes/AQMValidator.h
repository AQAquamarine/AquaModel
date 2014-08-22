//
//  AQMValidator.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQMValueValidator.h"

@interface AQMValidator : NSObject

# pragma mark - Standard validators

+ (id<AQMValueValidator>)presence;
+ (id<AQMValueValidator>)longerThan:(NSUInteger)length;
+ (id<AQMValueValidator>)shorterThan:(NSUInteger)length;
+ (id<AQMValueValidator>)regexp:(NSRegularExpression *)regexp;
+ (id<AQMValueValidator>)anyOf:(NSSet *)set;

# pragma mark - Shorthands

+ (id<AQMValueValidator>)email;
+ (id<AQMValueValidator>)URL;
+ (id<AQMValueValidator>)telephone;

@end

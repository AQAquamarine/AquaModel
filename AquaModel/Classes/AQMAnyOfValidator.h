//
//  AQMAnyOfValidator.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AQMValueValidator.h"

@interface AQMAnyOfValidator : NSObject <AQMValueValidator>

@property NSSet *set;

- (instancetype)initWithSet:(NSSet *)set;
- (instancetype)initWithArray:(NSArray *)array;

@end

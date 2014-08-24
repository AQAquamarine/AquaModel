//
//  AQMQueryable.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/24.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AQMQueryable <NSObject>

+ (NSString *)defaultScope;
+ (BOOL)softDeletion;

@end

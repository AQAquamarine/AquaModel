//
//  AQMValidatable.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/22.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AQMValidatable <NSObject>

- (BOOL)validate;

@optional

+ (NSDictionary *)validationMap;

@end

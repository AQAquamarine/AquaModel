//
//  AQMCallbackable.h
//  AquaModel
//
//  Created by kaiinui on 2014/08/23.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AQMCallbackable <NSObject>

@optional

- (void)afterCreate;

- (void)beforeValidation;
- (void)afterValidation;

- (void)beforeSave;
- (void)afterSave;

@end

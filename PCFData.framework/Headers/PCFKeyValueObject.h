//
//  PCFKeyValueObject.h
//  PCFData
//
//  Created by DX122-XL on 2014-10-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCFDataStore.h"

@interface PCFKeyValueObject : NSObject

@property BOOL force;

+ (instancetype)objectWithCollection:(NSString *)collection key:(NSString *)key;

- (instancetype)initWithCollection:(NSString *)collection key:(NSString *)key;

- (instancetype)initWithDataStore:(id<PCFDataStore>)dataStore collection:(NSString *)collection key:(NSString *)key;

- (PCFDataResponse *)get;

- (void)getWithCompletionBlock:(PCFDataResponseBlock)completionBlock;

- (PCFDataResponse *)putWithValue:(NSString *)value;

- (void)putWithValue:(NSString *)value completionBlock:(PCFDataResponseBlock)completionBlock;

- (PCFDataResponse *)delete;

- (void)deleteWithCompletionBlock:(PCFDataResponseBlock)completionBlock;

@end

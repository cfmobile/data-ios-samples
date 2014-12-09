//
//  PCFDataStore.h
//  PCFData
//
//  Created by DX122-XL on 2014-10-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCFResponse;

typedef void(^PCFResponseBlock)(PCFResponse *response);

@protocol PCFDataStore <NSObject>

- (PCFResponse *)getWithKey:(NSString *)key accessToken:(NSString *)accessToken;

- (void)getWithKey:(NSString *)key accessToken:(NSString *)accessToken completionBlock:(PCFResponseBlock)completionBlock;

- (PCFResponse *)putWithKey:(NSString *)key value:(NSString *)value accessToken:(NSString *)accessToken;

- (void)putWithKey:(NSString *)key value:(NSString *)value accessToken:(NSString *)accessToken completionBlock:(PCFResponseBlock)completionBlock;

- (PCFResponse *)deleteWithKey:(NSString *)key accessToken:(NSString *)accessToken;

- (void)deleteWithKey:(NSString *)key accessToken:(NSString *)accessToken completionBlock:(PCFResponseBlock)completionBlock;

@end



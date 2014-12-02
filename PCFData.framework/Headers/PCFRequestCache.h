//
//  PCFRequestCache.h
//  PCFData
//
//  Created by DX122-XL on 2014-11-21.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCFRequestCache : NSObject

- (void)queueGetWithToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key;

- (void)queuePutWithToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key value:(NSString *)value fallback:(NSString *)fallback;

- (void)queueDeleteWithToken:(NSString *)accessToken collection:(NSString *)collection key:(NSString *)key fallback:(NSString *)fallback;

@end

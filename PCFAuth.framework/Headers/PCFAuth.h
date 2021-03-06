//
//  PCFAuth.h
//  PCFAuth
//
//  Created by DX122-XL on 2014-12-17.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PCFAuthResponse.h"
#import "PCFLoginViewController.h"

typedef void(^PCFLoginObserverBlock)(void);

typedef void(^PCFLogoutObserverBlock)(void);

typedef void(^PCFAuthResponseBlock)(PCFAuthResponse*);

typedef NS_ENUM(NSInteger, PCFAuthLogLevel) {
    PCFAuthLogLevelDebug = 0,
    PCFAuthLogLevelInfo,
    PCFAuthLogLevelWarning,
    PCFAuthLogLevelError,
    PCFAuthLogLevelCritical,
    PCFAuthLogLevelNone
};

@interface PCFAuth : NSObject

+ (void)logLevel:(PCFAuthLogLevel)level;

+ (void)registerLoginObserverBlock:(PCFLoginObserverBlock)block;

+ (void)unregisterLoginObserverBlock;

+ (void)registerLogoutObserverBlock:(PCFLogoutObserverBlock)block;

+ (void)unregisterLogoutObserverBlock;

+ (PCFAuthResponse *)fetchToken;

+ (void)fetchTokenWithCompletionBlock:(PCFAuthResponseBlock)block;

+ (void)invalidateToken;

+ (void)logout;

+ (void)disableUserPrompt:(BOOL)disable;

@end

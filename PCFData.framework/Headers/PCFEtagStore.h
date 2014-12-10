//
//  PCFEtagStore.h
//  PCFData
//
//  Created by DX122-XL on 2014-12-08.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCFEtagStore : NSObject

- (instancetype)initWithDefaults:(NSUserDefaults *)defaults;

- (NSString *)getEtagForUrl:(NSURL *)url;

- (void)putEtagForUrl:(NSURL *)url etag:(NSString *)etag;

@end
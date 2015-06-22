//
//  PCFOfflineStore.h
//  PCFData
//
//  Created by DX122-XL on 2014-10-30.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCFDataStore.h"

@class PCFKeyValueRemoteStore, PCFKeyValueLocalStore;

@interface PCFKeyValueOfflineStore : NSObject <PCFDataStore>

- (instancetype)initWithLocalStore:(PCFKeyValueLocalStore *)localStore remoteStore:(PCFKeyValueRemoteStore *)remoteStore;

@end
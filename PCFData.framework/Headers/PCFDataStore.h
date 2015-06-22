//
//  PCFDataStore.h
//  PCFData
//
//  Created by DX122-XL on 2014-10-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PCFDataRequest, PCFDataResponse;

typedef void(^PCFDataResponseBlock)(PCFDataResponse *response);

@protocol PCFDataStore <NSObject>

- (PCFDataResponse *)executeRequest:(PCFDataRequest *)request;

- (void)executeRequest:(PCFDataRequest *)request completionBlock:(PCFDataResponseBlock)completionBlock;

@end



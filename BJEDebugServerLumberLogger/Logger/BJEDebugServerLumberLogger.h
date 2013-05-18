//
//  BJEDebugserverLumberLogger.h
//  BJEDebugServerLumberLogger
//
//  Created by Brendan Erwin on 5/18/13.
//  Copyright (c) 2013 Brendan J Erwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"
#import "GCDAsyncSocket.h"

@interface BJEDebugServerLumberLogger : DDAbstractLogger <DDLogger, GCDAsyncSocketDelegate>

- (instancetype)init;
- (instancetype)initWithHost:(NSString *)host port:(NSInteger)port;

@property (readonly) NSString *host;
@property (readonly) NSInteger port;
@property (strong, readonly, nonatomic) GCDAsyncSocket *asyncSocket;

@end

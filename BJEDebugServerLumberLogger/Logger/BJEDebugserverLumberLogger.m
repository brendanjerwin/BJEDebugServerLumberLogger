//
//  BJEDebugserverLumberLogger.m
//  BJEDebugServerLumberLogger
//
//  Created by Brendan Erwin on 5/18/13.
//  Copyright (c) 2013 Brendan J Erwin. All rights reserved.
//

#import "BJEDebugserverLumberLogger.h"

@interface BJEDebugserverLumberLogger () {
    NSMutableArray *_queue;
}
@end

@implementation BJEDebugserverLumberLogger

- (instancetype)init {
    return [self initWithHost:@"localhost" port:9000];
}

- (instancetype)initWithHost:(NSString *)host port:(NSInteger)port {
    self = [super init];
    if (self) {
        _host = host;
        _port = port;

        _asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        _queue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didAddLogger {
    NSError *error = nil;
    if (![_asyncSocket connectToHost:self.host onPort:self.port error:&error]) {
        NSLog(@"BJEDebugserverLumberLogger - error connecting to %@ on port %d: %@", self.host, self.port, error);
    }
}

- (void)willRemoveLogger{
    [_asyncSocket disconnectAfterReadingAndWriting];
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->logMsg;

    if (logFormatter) logMsg = [logFormatter formatLogMessage:logMessage];

    if (logMsg) {
        NSDictionary *info = @{
                           @"method": @2,
                           @"content": @{
                                   @"level": @(logMessage->logLevel),
                                   @"message": message
                                   }
                           };
        
        [self writeDictionary:info];
    }
}

- (void)writeDictionary:(NSDictionary *)dictionary {
    if (_asyncSocket.isDisconnected) return;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSString *jsonString = [NSString stringWithFormat:@"%@\n", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    [_asyncSocket writeData:data withTimeout:0 tag:0];
}

@end

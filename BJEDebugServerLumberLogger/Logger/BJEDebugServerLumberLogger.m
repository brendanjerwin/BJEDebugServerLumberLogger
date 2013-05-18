//
//  BJEDebugserverLumberLogger.m
//  BJEDebugServerLumberLogger
//
//  Created by Brendan Erwin on 5/18/13.
//  Copyright (c) 2013 Brendan J Erwin. All rights reserved.
//

#import "BJEDebugServerLumberLogger.h"

@interface BJEDebugServerLumberLogger () {
    NSMutableArray *_queue;
}
@end

@implementation BJEDebugServerLumberLogger

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
    if ([_asyncSocket connectToHost:self.host onPort:self.port error:&error]) {
        [self sendClear];
    } else {
        NSLog(@"BJEDebugserverLumberLogger - error connecting to %@ on port %ld: %@", self.host, (long)self.port, error);
    }
}

- (void)willRemoveLogger{
    [_asyncSocket disconnectAfterReadingAndWriting];
}

- (NSInteger)mapLogLevel:(NSInteger)input{
// The log levels for debugserver
//    LEVEL_NONE = 0
//    LEVEL_INFO = 1
//    LEVEL_WARNING = 2
//    LEVEL_ERROR = 3

    if ((input & LOG_FLAG_ERROR) == LOG_FLAG_ERROR) return 3;
    if ((input & LOG_FLAG_WARN) == LOG_FLAG_WARN) return 2;
    if ((input & LOG_FLAG_INFO) == LOG_FLAG_INFO) return 1;
    return 0;
}

- (void)sendClear
{
    [self writeDictionary:@{@"method": @1}];
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage->logMsg;

    if (formatter) logMsg = [formatter formatLogMessage:logMessage];

    if (logMsg) {
        NSDictionary *info = @{
                           @"method": @2,
                           @"content": @{
                                   @"level": @([self mapLogLevel:logMessage->logFlag]),
                                   @"message": logMsg
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

//
//  LogFodder.m
//  BJEDebugServerLumberLogger
//
//  Created by Brendan Erwin on 5/18/13.
//  Copyright (c) 2013 Brendan J Erwin. All rights reserved.
//

#import "LogFodder.h"
#import "DDLog.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation LogFodder
-(void)go{

    DDLogVerbose(@"This is Verbose");
    DDLogInfo(@"This is Info");
    DDLogWarn(@"This is Warn");
    DDLogError(@"This is Error");
}
@end

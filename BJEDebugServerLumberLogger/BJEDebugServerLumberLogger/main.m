//
//  main.m
//  BJEDebugServerLumberLogger
//
//  Created by Brendan Erwin on 5/18/13.
//  Copyright (c) 2013 Brendan J Erwin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "BJEDebugserverLumberLogger.h"
#import "LogFodder.h"   

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        [DDLog addLogger:[[BJEDebugServerLumberLogger alloc] init]];
        [DDLog addLogger:[DDTTYLogger sharedInstance]];

        [[[LogFodder alloc] init] go];
    }
    return 0;
}


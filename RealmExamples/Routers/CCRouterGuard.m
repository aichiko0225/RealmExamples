//
//  CCRouterGuard.m
//  RealmExamples
//  
//  Created by ash on 2019/4/11.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "CCRouterGuard.h"

@implementation CCRouterGuard
{
    RouterGuardCallback _callback;
}

+ (instancetype)routerGuardWithCallback:(RouterGuardCallback)callback
{
    return [[self alloc] initWithCallback:callback];
}

- (instancetype)initWithCallback:(RouterGuardCallback)callback
{
    self = [super init];
    if (self) {
        self->_callback = callback;
    }
    return self;
}

- (BOOL)routerGuardResult {
    return _callback();
}

@end

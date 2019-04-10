//
//  JLRoutes+Block.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "JLRoutes+Block.h"
#import <objc/runtime.h>

static NSString *routesCallbackKey = @"JLRRouteDefinition_routesCallbackKey";

@implementation JLRRouteDefinition (Block)
@dynamic routesCallback;

- (void)setRoutesCallback:(RoutesCallback)routesCallback {
    objc_setAssociatedObject(self, &routesCallbackKey, routesCallback, OBJC_ASSOCIATION_COPY);
}

- (RoutesCallback)routesCallback {
    return (RoutesCallback)objc_getAssociatedObject(self, &routesCallbackKey);
}

@end

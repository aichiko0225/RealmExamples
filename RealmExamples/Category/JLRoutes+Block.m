//
//  JLRoutes+Block.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "JLRoutes+Block.h"
#import <objc/runtime.h>

@implementation JLRoutes (Block)

+ (BOOL)routeURL:(nullable NSURL *)URL callback:(RoutesCallback)callback {
    // 将block 直接传入
    return [self routeURL:URL withParameters:@{RoutesCallbackKey: callback}];
}

+ (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters callback:(RoutesCallback)callback {
    NSMutableDictionary<NSString *, id> *new_parameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [new_parameters setObject:callback forKey:RoutesCallbackKey];
    return [self routeURL:URL withParameters:new_parameters];
}

@end

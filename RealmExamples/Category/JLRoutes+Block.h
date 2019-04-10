//
//  JLRoutes+Block.h
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import <JLRoutes/JLRoutes.h>
#import <JLRoutes/JLRRouteDefinition.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLRoutes (Block)

+ (BOOL)routeURL:(nullable NSURL *)URL callback:(RoutesCallback)callback;

+ (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters callback:(RoutesCallback)callback;

@end

NS_ASSUME_NONNULL_END

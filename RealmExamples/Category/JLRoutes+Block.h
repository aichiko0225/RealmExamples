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

@end

@interface JLRRouteDefinition (Block)

@property (nonatomic, copy) RoutesCallback routesCallback;

@end

NS_ASSUME_NONNULL_END

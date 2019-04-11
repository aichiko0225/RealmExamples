//
//  CCRouterManager.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//

#import "CCRouterManager.h"
#import <objc/message.h>

@implementation CCRouterManager

+ (instancetype)shareManager {
    static CCRouterManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)configDefaultRoutes {
    // configDefaultRoutes
    // 内部的scheme
    JLRoutes *route = [JLRoutes routesForScheme:route_scheme];
    
    [route addRoute:@"/push/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@", parameters);
        CCRouterGuard *routerGuard = [parameters objectForKey:RouterGuardKey];
        if (routerGuard) {
            BOOL result = [routerGuard routerGuardResult];
            if (!result) {
                return result;
            }
        }
        NSString *controller = [parameters objectForKey:@"controller"];
        UIViewController *pushVC = [CCRouterManager viewControllerWithClassName:controller parameters:parameters];
        if (pushVC) {
            pushVC.hidesBottomBarWhenPushed = YES;
            [[UIApplication topViewController].navigationController pushViewController:pushVC animated:YES];
            RoutesCallback callback = (RoutesCallback)[parameters objectForKey:RoutesCallbackKey];
            if ([pushVC respondsToSelector:@selector(responseCallback:)] && callback) {
                [pushVC performSelectorOnMainThread:@selector(responseCallback:) withObject:callback waitUntilDone:YES];
            }
            return YES;
        }
        return NO;
    }];
    
    [route addRoute:@"/present/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@", parameters);
        CCRouterGuard *routerGuard = [parameters objectForKey:RouterGuardKey];
        if (routerGuard) {
            BOOL result = [routerGuard routerGuardResult];
            if (!result) {
                return result;
            }
        }
        NSString *controller = [parameters objectForKey:@"controller"];
        UIViewController *presentVC = [CCRouterManager viewControllerWithClassName:controller parameters:parameters];
        if (presentVC) {
            [[UIApplication topViewController] presentViewController:presentVC animated:YES completion:nil];
            RoutesCallback callback = (RoutesCallback)[parameters objectForKey:RoutesCallbackKey];
            if ([presentVC respondsToSelector:@selector(responseCallback:)] && callback) {
                [presentVC performSelectorOnMainThread:@selector(responseCallback:) withObject:callback waitUntilDone:YES];
            }
            return YES;
        }
        return NO;
    }];
    
    [route addRoute:@"/present/navi/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@", parameters);
        CCRouterGuard *routerGuard = [parameters objectForKey:RouterGuardKey];
        if (routerGuard) {
            BOOL result = [routerGuard routerGuardResult];
            if (!result) {
                return result;
            }
        }
        NSString *controller = [parameters objectForKey:@"controller"];
        UIViewController *presentVC = [CCRouterManager viewControllerWithClassName:controller parameters:parameters];
        if (presentVC) {
            [[UIApplication topViewController] presentViewController:[[UINavigationController alloc] initWithRootViewController:presentVC] animated:YES completion:nil];
            RoutesCallback callback = (RoutesCallback)[parameters objectForKey:RoutesCallbackKey];
            if ([presentVC respondsToSelector:@selector(responseCallback:)] && callback) {
                [presentVC performSelectorOnMainThread:@selector(responseCallback:) withObject:callback waitUntilDone:YES];
            }
            return YES;
        }
        return NO;
    }];
    
    // 可以加入更多其他的路由
}

+ (UIViewController *)viewControllerWithClassName:(NSString *)className parameters:(NSDictionary<NSString *,id> * _Nonnull)parameters {
    Class class = NSClassFromString(className);
    if ([class respondsToSelector:@selector(routeWithParameters:)]) {
        SEL sel = @selector(routeWithParameters:);
        NSLog(@"%@", class);
        id newVC = ((id (*) (id, SEL, id))objc_msgSend)(class, sel, parameters);
        UIViewController *VC = (UIViewController *)newVC;
        return VC;
    }
    return nil;
}

@end

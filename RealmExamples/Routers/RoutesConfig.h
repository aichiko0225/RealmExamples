//
//  RoutesConfig.h
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//

#ifndef RoutesConfig_h
#define RoutesConfig_h

/** 路由回调函数 */
typedef void(^RoutesCallback)(id data);
/** 路由守卫函数 返回NO则中止路由行为 */
typedef BOOL(^RouterGuardCallback)(void);

static NSString *RoutesCallbackKey = @"RoutesCallback";
static NSString *RouterGuardKey = @"RouterGuardKey";

@protocol RoutesProtocol <NSObject>

@required
+ (instancetype)routeWithParameters:(NSDictionary<NSString *,id> *)parameters;
@optional
- (void)responseCallback:(RoutesCallback)callBack;

@end

static NSString *routePath1 = @"/push/RouteViewController1";

static NSString *routePath2 = @"/push/RouteViewController2";

static NSString *routePath3 = @"/push/RouteViewController3";

static NSString *routePath4 = @"/present/navi/RouteViewController1";

static NSString *route_scheme = @"whty";
static NSString *route_host = @"whty.com";

#endif /* RoutesConfig_h */

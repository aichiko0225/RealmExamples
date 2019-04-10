//
//  CCRouterManager.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//

#import "CCRouterManager.h"
#import "UIViewController+Extension.h"
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
    JLRoutes *route = [JLRoutes routesForScheme:@"whty"];
    
    [route addRoute:@"/view/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@", parameters);
        NSString *controller = [parameters objectForKey:@"controller"];
        Class class = NSClassFromString(controller);
        if ([class respondsToSelector:@selector(routeWithParameters:)]) {
            SEL sel = @selector(routeWithParameters:);
            NSLog(@"%@", class);
            id newVC = ((id (*) (id, SEL, id))objc_msgSend)(class, sel, parameters);
            UIViewController *pushVC = (UIViewController *)newVC;
            [[UIApplication topViewController].navigationController pushViewController:pushVC animated:YES];
        }
        return NO;
    }];
}

@end

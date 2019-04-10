//
//  UIViewController+Extension.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "UIViewController+Extension.h"
#import <objc/runtime.h>

@implementation UIApplication (Current)

+ (UIViewController *)topViewController {
    UIViewController *rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
    return [self getCurrentControllerWith:rootVC];
}

+ (UIViewController *)getCurrentControllerWith:(UIViewController *)root {
    if (root == nil) {
        return nil;
    }
    if (root.presentedViewController != nil) {
        return root.presentedViewController;
    }
    if ([root isKindOfClass:[UITabBarController class]]) {
        UITabBarController *rootVC = (UITabBarController *)root;
        return [self getCurrentControllerWith:rootVC.selectedViewController];
    }else if ([root isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootVC = (UINavigationController *)root;
        return [self getCurrentControllerWith:rootVC.visibleViewController];
    }else {
        return root;
    }
}

@end

static NSString *routesCallbackKey = @"routesCallbackKey";

@implementation UIViewController (Extension)
@dynamic routesCallback;

+ (instancetype)routeWithParameters:(NSDictionary<NSString *,id> *)parameters {
    UIViewController *vc = [[self alloc] init];
    NSString *title = [parameters objectForKey:@"title"];
    if (title) {
        vc.title = title;
    }
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList(vc.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *value = parameters[key];
        if (value != nil) {
            [vc setValue:value forKey:key];
        }
    }
    return vc;
}

- (void)responseCallback:(RoutesCallback)callBack {
    self.routesCallback = callBack;
}

- (void)setRoutesCallback:(RoutesCallback)routesCallback {
    objc_setAssociatedObject(self, &routesCallbackKey, routesCallback, OBJC_ASSOCIATION_COPY);
}

- (RoutesCallback)routesCallback {
    return (RoutesCallback)objc_getAssociatedObject(self, &routesCallbackKey);
}

@end

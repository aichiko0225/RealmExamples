//
//  UIViewController+Extension.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "UIViewController+Extension.h"

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

@implementation UIViewController (Extension)

+ (instancetype)routeWithParameters:(NSDictionary<NSString *,id> *)parameters {
    return [[self alloc] init];
}

@end

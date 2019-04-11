//
//  CCRouterGuard.h
//  RealmExamples
//  
//  Created by ash on 2019/4/11.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 路由守卫
 * 可以为router 全局设置守卫也可以单独设置守卫
 */
@interface CCRouterGuard : NSObject

+ (instancetype)routerGuardWithCallback:(RouterGuardCallback)callback;

- (BOOL)routerGuardResult;

@end

NS_ASSUME_NONNULL_END

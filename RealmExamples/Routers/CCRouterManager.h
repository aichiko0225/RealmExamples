//
//  CCRouterManager.h
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 路由管理类，添加各种类型的路由
 */
@interface CCRouterManager : NSObject

+ (instancetype)shareManager;

- (void)configDefaultRoutes;

@end

NS_ASSUME_NONNULL_END

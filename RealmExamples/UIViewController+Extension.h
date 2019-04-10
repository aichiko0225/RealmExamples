//
//  UIViewController+Extension.h
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Current)

+ (UIViewController *)topViewController;

@end


@interface UIViewController (Extension)<RoutesProtocol>

@end

NS_ASSUME_NONNULL_END

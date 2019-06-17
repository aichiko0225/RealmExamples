//
//  UITextField+Swizzle.m
//  RealmExamples
//  
//  Created by ash on 2019/6/4.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "UITextField+Swizzle.h"
#import <objc/runtime.h>

void Swizzle(Class c, SEL orig, SEL new) {
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))){
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@interface UITextField ()


@end

@implementation UITextField (Swizzle)

+ (void)load {
    
    Swizzle(self, @selector(setKeyboardType:), @selector(cc_setKeyboardType:));
    
}


- (void)cc_setKeyboardType:(UIKeyboardType)keyboardType {
    objc_setAssociatedObject(self, @"cc_keyboardType", @(keyboardType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIKeyboardType)keyboardType {
    id type1 = objc_getAssociatedObject(self, @"cc_keyboardType");
    if (type1 != nil) {
        return [type1 intValue];
    }
    return UIKeyboardTypeDefault;
}

@end

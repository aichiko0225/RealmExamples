//
//  NSURL+Routes.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "NSURL+Routes.h"

@implementation NSURL (Routes)

+ (instancetype)URLWithRoutePath:(NSString *)routePath {
    NSString *scheme = @"whty";
    NSString *baseURL = @"whty.com";
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@", scheme, baseURL]];
    return [self URLWithString:routePath relativeToURL:url];
}

@end

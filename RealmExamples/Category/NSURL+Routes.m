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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@", route_scheme, route_host]];
    return [self URLWithString:routePath relativeToURL:url];
}

@end

//
//  Person.m
//  RealmExamples
//
//  Created by 赵光飞 on 2019/4/8.
//  Copyright © 2019 ash. All rights reserved.
//

#import "Person.h"

@implementation TestObject

- (id)copyWithZone:(nullable NSZone *)zone {
    TestObject *copyItem = [[self class] allocWithZone:zone];
    copyItem._ID = self._ID;
    copyItem.object = self.object;
    return copyItem;
}


- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    TestObject *copyItem = [[self class] allocWithZone:zone];
    copyItem._ID = self._ID;
    copyItem.object = self.object;
    return copyItem;
}

@end

@implementation Dog

+ (NSString *)primaryKey {
    return @"ID";
}

+ (NSArray<NSString *> *)indexedProperties {
    return @[@"ID"];
}

+ (NSInteger)incrementaID {
    Dog *retNext = [[[Dog allObjects] sortedResultsUsingKeyPath:@"ID" ascending:YES] lastObject];
    if (retNext == nil) {
        return 0;
    }
    return retNext.ID + 1;
}

+ (NSDictionary *)defaultPropertyValues {
    return @{
             @"ID": @([Dog incrementaID])
             };
}

@end

@implementation Person

@end

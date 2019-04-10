//
//  Person.h
//  RealmExamples
//
//  Created by 赵光飞 on 2019/4/8.
//  Copyright © 2019 ash. All rights reserved.
//

#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Dog : RLMObject

@property NSInteger ID;

@property NSString *name;

@property NSData * _Nullable picture;

@property NSInteger age;

@end

RLM_ARRAY_TYPE(Dog)
@interface Person : RLMObject

@property NSString *name;

@property RLMArray<Dog *><Dog> *dogs;

@end

NS_ASSUME_NONNULL_END

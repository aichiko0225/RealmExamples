//
//  RACViewController1.m
//  RealmExamples
//  
//  Created by ash on 2019/4/22.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "RACViewController1.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACViewController1 ()

@end

@implementation RACViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testFunc];
}

- (void)testFunc {
    
    RACBehaviorSubject<NSNumber *> *subject = [RACBehaviorSubject behaviorSubjectWithDefaultValue:@"1"];
    
    [[[subject filter:^BOOL(NSNumber * _Nullable value) {
        return [value integerValue] > 1;
    }] catch:^RACSignal * _Nonnull(NSError * _Nonnull error) {
        NSLog(@"%@", error);
        return [RACBehaviorSubject behaviorSubjectWithDefaultValue:@(5555)];
    }] subscribeNext:^(NSNumber * _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    [subject sendNext:@(222)];
    [subject sendNext:@(0000)];
    
    NSArray *strings = @[@"11", @"222", @"333", @"44", @"555", @"666", @"777"];
    RACSequence *results = [[strings.rac_sequence filter:^BOOL(NSString * _Nullable value) {
        return value.length > 2;
    }] map:^id _Nullable(NSString * _Nullable value) {
        return [value stringByAppendingString:@"foobar"];
    }];
    
    for (id i in results) {
        NSLog(@"%@", i);
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [subject sendNext:@(33333)];
    });
    
    
    [[subject bind:^RACSignalBindBlock _Nonnull{
        return ^ RACSignal * _Nullable(id _Nullable value, BOOL *stop) {
            if ([value integerValue] == 0) {
                *stop = NO;
            }
            return [RACSignal return:@(999)];
        };
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@" ===== %@", x);
    }];
    // [subject sendError:[NSError errorWithDomain:@"1" code:1 userInfo:nil]];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

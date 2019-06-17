//
//  ViewController.m
//  RealmExamples
//
//  Created by 赵光飞 on 2019/4/8.
//  Copyright © 2019 ash. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UITextField+Swizzle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    RLMRealm *realm = [RLMRealm defaultRealm];
    // 获取 Realm 文件的父目录
    NSString *folderPath = realm.configuration.fileURL.URLByDeletingLastPathComponent.path;
    NSLog(@"%@", folderPath);
    // 使用的方法和常规 Objective‑C 对象的使用方法类似
    Dog *mydog = [[Dog alloc] init];
    mydog.name = @"Rex";
    mydog.age = 1;
    mydog.picture = nil; // 该属性是可空的
    NSLog(@"Name of dog: %@", mydog.name);

    // 检索 Realm 数据库，找到小于 2 岁 的所有狗狗
    RLMResults<Dog *> *puppies = [Dog objectsWhere:@"age < 2"];
    NSLog(@"%ld", puppies.count);

    // 存储数据十分简单
    [realm transactionWithBlock:^{
        [realm addObject:mydog];
    }];
    NSLog(@"%ld", puppies.count);

    // 可以在任何一个线程中执行检索、更新操作

    dispatch_async(dispatch_queue_create("background", 0), ^{
        @autoreleasepool {
            Dog *theDog = [[Dog objectsWhere:@"age == 1"] firstObject];
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm beginWriteTransaction];
            theDog.age = 3;
            [realm commitWriteTransaction];
            
            // 检索 Realm 数据库，找到小于 2 岁 的所有狗狗
            RLMResults<Dog *> *puppies = [Dog objectsWhere:@"age < 2"];
            NSLog(@"%ld", puppies.count);
        }
    });
     */
    
//    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
//    textField.backgroundColor = [UIColor redColor];
//    textField.keyboardType = UIKeyboardTypeNumberPad;
//    [self.view addSubview:textField];
    
    
    TestObject *test1 = [[TestObject alloc] init];
    test1._ID = @"2222";
    test1.object = [[TestObject alloc] init];
    
    NSLog(@"============== %@", test1.object);
    
    NSArray *arr = @[test1._ID];
    NSArray<TestObject *> *arr1 = @[test1.object];
    TestObject* arr2[1] = {test1.object};
    
    NSLog(@"arr.firstObject === %@", arr.firstObject);
    NSLog(@"arr1.firstObject === %@", arr1.firstObject);
    NSLog(@"arr2[0] === %@", arr2[0]);
    
    NSLog(@"arr1.firstObject _ID === %@", arr1.firstObject._ID);
    NSLog(@"arr2[0] _ID === %@", arr2[0]._ID);
    
    test1._ID = @"33333";
    test1.object._ID = @"4444";
    
    NSLog(@"test1.object ============== %@", test1.object);
    
    NSLog(@"arr.firstObject === %@", arr.firstObject);
    NSLog(@"arr1.firstObject === %@", arr1.firstObject);
    NSLog(@"arr2[0] === %@", arr2[0]);
    
    NSLog(@"arr1.firstObject _ID === %@", arr1.firstObject._ID);
    NSLog(@"arr2[0] _ID === %@", arr2[0]._ID);
}

- (IBAction)route1:(UIButton *)sender {
    
    NSString *routePath = [routePath1 stringByAppendingString:@"?keyword=333&title=test_title"];
    BOOL r1 = [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath]];
    NSLog(@"route1 === %d", r1);
}

- (IBAction)route2:(UIButton *)sender {
    BOOL r2 = [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath2]];
    NSLog(@"route2 === %d", r2);
}

- (IBAction)route3:(UIButton *)sender {
    BOOL r3 = [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath3] callback:^(id  _Nonnull data) {
        NSLog(@"route3 callback %@", data);
    }];
    NSLog(@"route3 === %d", r3);
}

- (IBAction)present1:(UIButton *)sender {
    // 守卫可以进行拦截
    [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath3] routerGuard:[CCRouterGuard routerGuardWithCallback:^BOOL{
        return NO;
    }]];
}


@end

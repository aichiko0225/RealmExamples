# RealmExamples

主要是Realm & coobjc & JLRoutes 的相关用法。

#### JLRoutes部分

主要是实现了简单的路由功能，可能后面还有扩展功能

在`AppDelegate`中配置默认的路由实现方式
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[CCRouterManager shareManager] configDefaultRoutes];
    return YES;
}
```

用法也很简单
```objc
+ (BOOL)routeURL:(nullable NSURL *)URL;

- (BOOL)routeURL:(nullable NSURL *)URL;

+ (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters;

- (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters;
```

也可以传入一个回调函数

```objc
@interface JLRoutes (Block)

+ (BOOL)routeURL:(nullable NSURL *)URL callback:(RoutesCallback)callback;

+ (BOOL)routeURL:(nullable NSURL *)URL withParameters:(nullable NSDictionary<NSString *, id> *)parameters callback:(RoutesCallback)callback;

@end
```



**Example**
```objc

- (IBAction)route1:(UIButton *)sender {
    NSString *routePath = [routePath1 stringByAppendingString:@"?keyword=xxkeyword&title=test_title"];
    BOOL r1 = [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath]];
    
    BOOL r2 = [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath2]];
    
    BOOL r3 = [JLRoutes routeURL:[NSURL URLWithRoutePath:routePath3] callback:^(id  _Nonnull data) {
        NSLog(@"route3 callback %@", data);
    }];
    
    
    
}
```


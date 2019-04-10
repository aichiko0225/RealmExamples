//
//  RouteViewController1.m
//  RealmExamples
//  
//  Created by ash on 2019/4/10.
//  Copyright © 2019 whty. All rights reserved.
//
    

#import "RouteViewController1.h"

@interface RouteViewController1 ()

@end

@implementation RouteViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.title.length == 0) {
        self.navigationItem.title = [[self class] description];
    }
    
    NSLog(@"keyword == %@", _keyword);
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

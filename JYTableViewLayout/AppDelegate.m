//
//  AppDelegate.m
//  JYTableViewLayout
//
//  Created by QS_Jey on 2020/11/24.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
       [self.window setRootViewController:[[ViewController alloc]init]];
       [self.window makeKeyAndVisible];
       return YES;
}




@end

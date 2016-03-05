//
//  AppDelegate.m
//  fpBird
//
//  Created by tomyAmi on 2015/01/14.
//  Copyright (c) 2015年 tomyAmi. All rights reserved.
//

#import "AppDelegate.h"
#import "scoreDBController.h"
#import "firstViewController.h"
#import "UIDevice-Hardware.h"
#import "recordUpDBController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)tes{}

-(void)testDB{
    scoreDBController* scoreDB = [scoreDBController new];
    [scoreDB createDB];
    recordUpDBController* record = [recordUpDBController new];
    [record createDB];

}

-(void)createDataBase{
    NSUserDefaults* userDefault = [NSUserDefaults standardUserDefaults];
    if(![userDefault valueForKey:@"createTrue"]){
        [userDefault setBool:YES forKey:@"createTrue"];
        [self testDB];
    }
}

-(BOOL)application:(UIApplication*)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self createDataBase];
    
        
    //NSLog(@"%@",[UIDevice currentDevice].platform);
    
    /*NSString * storyBoardName;  // StoryBoardの名称設定用
    
    // 機種の取得
    NSString *modelname = [ [ UIDevice currentDevice] model];
    
    // iPadかどうか判断する
    if ([modelname hasPrefix:@"iPad"] ) {
        // Windowスクリーンのサイズを取得
        CGRect r = [[UIScreen mainScreen] bounds];
        
        if(r.size.height == 480){
            // NSLog(@"Old iPhone");
            storyBoardName = @"Main";
            
        }else{
            storyBoardName =@"Main";
        }
        storyBoardName =@"Main_iPad";
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
        firstViewController* mainViewController = [[firstViewController alloc]init];
        mainViewController = [storyboard instantiateInitialViewController];
        self.window.rootViewController = mainViewController;
        [self.window makeKeyAndVisible];
    }*/
    
    //[self testDB];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

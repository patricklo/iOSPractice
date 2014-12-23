//
//  AppDelegate.m
//  AngryBird
//
//  Created by Patrick Lo on 12/24/14.
//  Copyright (c) 2014 Patrick Lo. All rights reserved.
//  AppDelegate.m --> AppDelegate.mm
//  can mix OC/C/C++ languages

#import "AppDelegate.h"
#import "ViewController.h"
#import "cocos2d.h"
// every cocos2d , need to import cocos2d

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    if (![CCDirector setDirectorType: kCCDirectorTypeDisplayLink]){
        //set director type as kCCDirectorTypeDisplayLink
        // if set success , then returen yes, otherwise set as default
        [CCDirector setDirectorType: kCCDirectorTypeDefault];
    }
    
    CCDirector *director = [CCDirector sharedDirector];
    
    //get Director which is singlton mode
    //create stage
    EAGLView *glView = [EAGLView viewWithFrame:[self.window bounds] pixelFormat:kEAGLColorFormatRGB565 depthFormat:0];
    
    // connect with director and stage
    [director setOpenGLView:glView];

    [director setDeviceOrientation:kCCDeviceOrientationLandscapeLeft];
    
    // set refresh rate 60p/s
    [director setAnimationInterval:1.0f/60.0f];
    [director setDisplayFPS:YES];
    
    ViewController *rvc = [[ViewController alloc] init];
    [rvc setView:glView];
    [self.window setRootViewController:rvc];
    [rvc release];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [[CCDirector sharedDirector] pause];
    //pause game
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[CCDirector sharedDirector] stopAnimation];
    //stop refresh
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[CCDirector sharedDirector] startAnimation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[CCDirector sharedDirector] resume];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    CCDirector *director = [CCDirector sharedDirector];
    [[director openGLView] removeFromSuperview];
    [director end];
                            
}

-(void) applicationSignificantTimeChange:(UIApplication *)application{
    [[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

@end

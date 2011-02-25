//
//  waq_demoAppDelegate.m
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import "waq_demoAppDelegate.h"
#import "ImageListController.h"


@implementation waq_demoAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Set the navigation controller as the window's root view controller and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    [navigationController release];
    [window release];
    [super dealloc];
}


@end


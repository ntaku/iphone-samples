//
//  SimpleCameraAppDelegate.m
//  SimpleCamera
//
//  Created by ntaku on 09/04/22.
//  Copyright http://d.hatena.ne.jp/ntaku 2009. All rights reserved.
//

#import "SimpleCameraAppDelegate.h"
#import "MyViewCtrl.h"

@implementation SimpleCameraAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	MyViewCtrl *ctrl = [[MyViewCtrl alloc] initWithNibName:nil bundle:nil];
	[window addSubview:ctrl.view];

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

//
//  SwipeGestureAppDelegate.m
//  SwipeGesture
//
//  Created by ntaku on 09/04/18.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "SwipeGestureAppDelegate.h"
#import "MyView.h"

@implementation SwipeGestureAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	MyView *view = [[MyView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	[window addSubview:view];

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

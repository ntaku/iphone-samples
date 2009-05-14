//
//  OriginalTabBarAppDelegate.m
//  OriginalTabBar
//
//  Created by ntaku on 09/05/14.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku All rights reserved.
//

#import "OriginalTabBarAppDelegate.h"
#import "MyTabViewController.h"
#import "ViewCtrl1.h"

@implementation OriginalTabBarAppDelegate

@synthesize window, tab;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	tab = [[MyTabViewController alloc] initWithNibName:nil bundle:nil];
	[window addSubview:tab.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[tab release];
    [window release];
    [super dealloc];
}

@end

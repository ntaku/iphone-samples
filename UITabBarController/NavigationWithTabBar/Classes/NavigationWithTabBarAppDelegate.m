//
//  NavigationWithTabBarAppDelegate.m
//  NavigationWithTabBar
//
//  Created by ntaku on 09/04/21.
//  Copyright http://d.hatena.ne.jp/ntaku 2009. All rights reserved.
//

#import "NavigationWithTabBarAppDelegate.h"
#import "MyView01.h"
#import "MyView02.h"

@implementation NavigationWithTabBarAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	// navigation controller 
	MyView01 *ctrl01 = [[MyView01 alloc] initWithNibName:nil bundle:nil];
	MyView02 *ctrl02 = [[MyView02 alloc] initWithNibName:nil bundle:nil];
	
	// navigation controller 
	UINavigationController *navi = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
	[navi pushViewController:ctrl01 animated:NO];

	[ctrl01 release];

	// tabbar controller
	UITabBarController *tab = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
	[tab setViewControllers:[NSArray arrayWithObjects:navi, ctrl02, nil]];
	[window addSubview:tab.view];
	
	[navi release];
	[ctrl02 release];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

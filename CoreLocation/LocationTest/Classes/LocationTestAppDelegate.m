//
//  LocationTestAppDelegate.m
//  LocationTest
//
//  Created by ntaku on 09/04/18.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "LocationTestAppDelegate.h"
#import "LocationViewCtrl.h"

@implementation LocationTestAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	LocationViewCtrl *ctrl = [[LocationViewCtrl alloc] initWithNibName:nil bundle:nil];
	[window addSubview:ctrl.view];

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

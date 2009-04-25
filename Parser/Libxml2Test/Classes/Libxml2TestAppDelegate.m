//
//  Libxml2TestAppDelegate.m
//  Libxml2Test
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "Libxml2TestAppDelegate.h"
#import "XPathTest.h"

@implementation Libxml2TestAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	[[[XPathTest alloc] init] start];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

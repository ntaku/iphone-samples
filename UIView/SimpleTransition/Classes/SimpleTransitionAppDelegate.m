//
//  SimpleTransitionAppDelegate.m
//  SimpleTransition
//
//  Created by ntaku on 09/08/09.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "SimpleTransitionAppDelegate.h"
#import "MyView.h"

@implementation SimpleTransitionAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	MyView *view = [[MyView alloc] initWithNibName:nil bundle:nil];
	[window addSubview:view.view];	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

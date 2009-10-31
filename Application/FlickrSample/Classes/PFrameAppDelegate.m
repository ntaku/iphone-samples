//
//  PFrameAppDelegate.m
//  PFrame
//
//  Created by ntaku on 09/10/11.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "PFrameAppDelegate.h"
#import "SearchViewCtrl.h"

@implementation PFrameAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	SearchViewCtrl *searchViewCtrl = [[SearchViewCtrl alloc] initWithNibName:nil bundle:nil];	
	[window	 addSubview:searchViewCtrl.view];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

//
//  SimpleTableViewCellAppDelegate.m
//  SimpleTableViewCell
//
//  Created by ntaku on 09/04/18.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "SimpleTableViewCellAppDelegate.h"
#import "MyViewCtrl.h"

@implementation SimpleTableViewCellAppDelegate

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

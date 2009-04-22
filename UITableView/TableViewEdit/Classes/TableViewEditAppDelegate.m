//
//  TableViewEditAppDelegate.m
//  TableViewEdit
//
//  Created by ntaku on 09/04/21.
//  Copyright http://d.hatena.ne.jp/ntaku 2009. All rights reserved.
//

#import "TableViewEditAppDelegate.h"
#import "TableViewCtrl.h"

@implementation TableViewEditAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	UINavigationController *navi = [[UINavigationController alloc] initWithNibName:nil bundle:nil];

	TableViewCtrl *tableview = [[TableViewCtrl alloc]initWithNibName:nil bundle:nil];
	[navi pushViewController:tableview animated:NO];
	[tableview release];
	
	[window addSubview:navi.view];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

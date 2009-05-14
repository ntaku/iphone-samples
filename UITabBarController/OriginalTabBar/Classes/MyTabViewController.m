//
//  MyTabViewController.m
//  OriginalTabBar
//
//  Created by ntaku on 09/05/14.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku All rights reserved.
//

#import "MyTabViewController.h"
#import "ViewCtrl1.h"
#import "ViewCtrl2.h"
#import "ViewCtrl3.h"
#import "ViewCtrl4.h"
#import "ViewCtrl5.h"

@implementation MyTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

		UINavigationController *nv1 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
		ViewCtrl1 *v1 = [[ViewCtrl1 alloc] initWithNibName:nil bundle:nil];
		[nv1 pushViewController:v1 animated:NO];
		[v1 release];

		UINavigationController *nv2 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
		ViewCtrl2 *v2 = [[ViewCtrl2 alloc] initWithNibName:nil bundle:nil];
		[nv2 pushViewController:v2 animated:NO];
		[v2 release];
		
		UINavigationController *nv3 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
		ViewCtrl3 *v3 = [[ViewCtrl3 alloc] initWithNibName:nil bundle:nil];
		[nv3 pushViewController:v3 animated:NO];
		[v3 release];
		
		UINavigationController *nv4 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
		ViewCtrl4 *v4 = [[ViewCtrl4 alloc] initWithNibName:nil bundle:nil];
		[nv4 pushViewController:v4 animated:NO];
		[v4 release];
		
		UINavigationController *nv5 = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
		ViewCtrl5 *v5 = [[ViewCtrl5 alloc] initWithNibName:nil bundle:nil];
		[nv5 pushViewController:v5 animated:NO];
		[v5 release];
		
		[self setViewControllers:[NSArray arrayWithObjects:nv1, nv2, nv3, nv4, nv5, nil] animated:NO];
		[nv1 release];
		[nv2 release];
		[nv3 release];
		[nv4 release];
		[nv5 release];	
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

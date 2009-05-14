//
//  ViewCtrl1.m
//  OriginalTabBar
//
//  Created by ntaku on 09/05/14.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku All rights reserved.
//

#import "ViewCtrl1.h"
#import "OriginalTabBarAppDelegate.h"
#import "MyTabViewController.h"

@implementation ViewCtrl1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {		
		self.title =  @"HOME";
		self.tabBarItem.image = [UIImage imageNamed:@"home_32.png"];		
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];

	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(20,40,100,40);
	[button	setTitle:@"hideTabBar" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(hideTab) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button2.frame = CGRectMake(180,40,100,40);
	[button2 setTitle:@"showTabBar" forState:UIControlStateNormal];
	[button2 addTarget:self action:@selector(showTab) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button2];
	
}

-(void) hideTab{
	[[UIAppDelegate tab] hideTabBar:YES animated:YES];	
}

-(void) showTab{
	[[UIAppDelegate tab] hideTabBar:NO animated:YES];	
}

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

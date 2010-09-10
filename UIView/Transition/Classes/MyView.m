    //
//  MyView.m
//  Transition
//
//  Created by Takuto Nishioka on 10/09/11.
//  Copyright 2010 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MyView.h"


@interface MyView()
- (void)startTransition:(id)sender;
- (void)endTransition;
@end


@implementation MyView

- (id)init{
	if(self = [super init]){		
		UIButton *go = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[go setTitle: @"Start Transition" forState:UIControlStateNormal];
		[go setFrame:CGRectMake(10, 10, 300, 30) ];
		[go addTarget:self action:@selector(startTransition:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:go];
		
		UIImageView *view1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
		[view1 setBackgroundColor:[UIColor blueColor]];
		[self.view addSubview:view1];		
	}
	return self;	
}

- (void)startTransition:(id)sender{
	
	CATransition *animation = [CATransition animation];
	
	// type of animation
	[animation setType:kCATransitionFade];
	[animation setSubtype:kCATransitionFromBottom];
	
	// length of animation
	[animation setDuration:0.5];
	
	// timing of animation
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
	
	// whather recieve the events
	[animation setDelegate:self];
	
	// register animation setting
	[[self.view layer] addAnimation:animation forKey: @"transitionViewAnimation"];	
	
	UIImageView *view2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 300)];
	[view2 setBackgroundColor:[UIColor redColor]];
	[self.view addSubview:view2];
}

- (void)endTransition{
	
}

- (void)animationDidStart:(CAAnimation *)anim{
	NSLog(@"start");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
	NSLog(@"end");	
}

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

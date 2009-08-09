//
//  MyView.m
//  SimpleTransition
//
//  Created by ntaku on 09/08/09.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MyView.h"

@implementation MyView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

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

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end

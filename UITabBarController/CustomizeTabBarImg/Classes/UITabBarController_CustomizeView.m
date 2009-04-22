//
//  UITabBarController_CustomizeView.m
//  CustomizeTabBarImg
//
//  Created by ntaku on 09/04/21.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import "UITabBarController_CustomizeView.h"

@implementation UITabBarController (CustomizeView)
- (void) setBackground{
	UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,48)];
	view.backgroundColor = [UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:0.5];	
	[[self tabBar] addSubview:view];
	[[self tabBar] sendSubviewToBack:view];
	[view release];
}
@end


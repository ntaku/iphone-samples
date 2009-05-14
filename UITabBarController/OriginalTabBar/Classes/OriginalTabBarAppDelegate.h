//
//  OriginalTabBarAppDelegate.h
//  OriginalTabBar
//
//  Created by ntaku on 09/05/14.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIAppDelegate (OriginalTabBarAppDelegate *)[[UIApplication sharedApplication] delegate]

@class MyTabViewController;

@interface OriginalTabBarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MyTabViewController *tab;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MyTabViewController *tab;

@end

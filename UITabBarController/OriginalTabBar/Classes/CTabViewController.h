//
//  CTabViewController.h
//  OriginalTabBar
//
//  Created by ntaku on 09/05/14.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku All rights reserved.
//

#import <UIKit/UIKit.h>

#define CTABBAR_BGIMG_NAME @"tabbar.png"
#define CTABBAR_CELL_R 0.16
#define CTABBAR_CELL_G 0.23
#define CTABBAR_CELL_B 0.61
#define CTABBAR_CELL_A 1.0

#define CTABBAR_WIDTH 320
#define CTABBAR_HEIGHT 48
#define CTABBAR_TOP 480 - 20 - CTABBAR_HEIGHT

@class CTabViewCell;

@interface CTabViewController : UIViewController <UITabBarDelegate>{

	NSUInteger selectedIndex;
	
@private
	UITabBar               *_tabBar;
	NSMutableArray         *_viewControllers;
	NSMutableArray         *_tabBarItems;
    UIViewController       *_selectedViewController;
	CTabViewCell           *_selectedCellBack;
	
}

@property(nonatomic) NSUInteger selectedIndex;

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated;
- (void)activateViewControllerAt:(int)index;
- (void)hideTabBar:(BOOL)b animated:(BOOL)b2;

@end

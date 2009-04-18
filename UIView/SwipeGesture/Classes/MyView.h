//
//  MyView.h
//  SwipeGesture
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyView : UIView {

	NSDate *startTime;
	CGPoint startPt;
	int swipe_direction;
}

@property (nonatomic, retain) NSDate *startTime;

@end

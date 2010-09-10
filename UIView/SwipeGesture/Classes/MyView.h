//
//  MyView.h
//  Gesture
//
//  Created by Takuto Nishioka on 10/09/11.
//  Copyright 2010 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyView : UIView {
	
 @private	
	NSDate *startTime;
	CGPoint startPt;
	int swipe_direction;
}

@end

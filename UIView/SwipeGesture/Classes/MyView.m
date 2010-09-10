//
//  MyView.m
//  Gesture
//
//  Created by Takuto Nishioka on 10/09/11.
//  Copyright 2010 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import "MyView.h"

#define HORIZ_SWIPE_MIN   12
#define VERT_SWIPE_MAX     8
#define SWIPE_NON          0
#define SWIPE_LEFT         1
#define SWIPE_RIGHT        2

@implementation MyView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	startPt = [[touches anyObject] locationInView:self];	
	startTime = [[NSDate date] retain];	
	swipe_direction = SWIPE_NON;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint curPt = [[touches anyObject] locationInView:self];	
	
	// check horizontal swipe
	if(fabsf(startPt.x - curPt.x) >= HORIZ_SWIPE_MIN && fabsf(startPt.y - curPt.y) <= VERT_SWIPE_MAX){
		if(startPt.x < curPt.x){
			swipe_direction = SWIPE_LEFT;
		}else{
			swipe_direction = SWIPE_RIGHT;
		}
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint curPt = [[touches anyObject] locationInView:self];	
	
	if(swipe_direction != SWIPE_NON){
		// calcurate swipe speed 
		NSTimeInterval dt = -[startTime timeIntervalSinceNow];
		int dx = fabsf(startPt.x - curPt.x);
		double speed = dx / dt;		
		NSLog(@"%@", [NSString stringWithFormat:@"dir:%i, dx:%i, dt:%f, speed:%f", swipe_direction, dx, dt, speed]);	
	}
	
	[startTime release];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end

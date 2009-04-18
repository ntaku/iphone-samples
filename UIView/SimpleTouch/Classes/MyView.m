//
//  MyView.m
//  SimpleTouch
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import "MyView.h"


@implementation MyView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint pt = [[touches anyObject] locationInView:self];	
	NSLog([NSString stringWithFormat:@"start (%f, %f)", pt.x, pt.y]);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint pt = [[touches anyObject] locationInView:self];	
	NSLog([NSString stringWithFormat:@"move (%f, %f)", pt.x, pt.y]);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint pt = [[touches anyObject] locationInView:self];	
	NSLog([NSString stringWithFormat:@"end (%f, %f)", pt.x, pt.y]);
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end

//
//  MyView.m
//  SimpleTouch
//
//  Created by Takuto Nishioka on 10/09/11.
//  Copyright http://d.hatena.ne.jp/ntaku 2010. All rights reserved.
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
	NSLog(@"%@", [NSString stringWithFormat:@"start (%f, %f)", pt.x, pt.y]);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint pt = [[touches anyObject] locationInView:self];	
	NSLog(@"%@", [NSString stringWithFormat:@"move (%f, %f)", pt.x, pt.y]);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	CGPoint pt = [[touches anyObject] locationInView:self];	
	NSLog(@"%@", [NSString stringWithFormat:@"end (%f, %f)", pt.x, pt.y]);
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

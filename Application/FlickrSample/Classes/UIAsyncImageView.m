//
//  UIAsyncImageView.m
//  AsyncImage
//
//  Created by ntaku on 09/10/31.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIAsyncImageView.h"

@implementation UIAsyncImageView

-(void)loadImage:(NSString *)url{
	[self abort];
	self.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.2];	
	data = [[NSMutableData alloc] initWithCapacity:0];

	NSURLRequest *req = [NSURLRequest 
						 requestWithURL:[NSURL URLWithString:url] 
						 cachePolicy:NSURLRequestUseProtocolCachePolicy
						 timeoutInterval:30.0];
	conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//	NSLog(@"connection didRecieveResponse");
	[data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)nsdata{
//	NSLog(@"connection didReceiveData len=%d", [nsdata length]);
	[data appendData:nsdata];	
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
//	NSLog(@"connection didFailWithError - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	[self abort];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//	NSLog(@"connection connectionDidFinishLoading");	
	self.contentMode = UIViewContentModeScaleAspectFit;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight;		

	self.image = [UIImage imageWithData:data];
	[self addCorner];
	
	[self abort];
}

-(void)abort{
	if(conn != nil){
		[conn cancel];
		[conn release];
		conn = nil;
	}
	if(data != nil){
		[data release];
		data = nil;
	}
}

- (void)dealloc {
	[conn cancel];
    [conn release];
    [data release];
    [super dealloc];
}

- (void)addCorner{	

	CALayer *layer = self.layer;
	layer.masksToBounds = YES;
	
	CGFloat bg_rgba[] = { 1.0, 0.0, 0.0, 0.7 };
	CGFloat border_rgba[] = { 0.0, 0.0, 0.0, 0.2 };
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef bgColor = CGColorCreate(colorSpace, bg_rgba);
	layer.backgroundColor = bgColor;
	CGColorRelease(bgColor);
	
	CGColorRef borderColor = CGColorCreate(colorSpace, border_rgba);
	layer.borderColor = borderColor;
	layer.borderWidth = 1;
	CGColorRelease(borderColor);
	
	CGColorSpaceRelease(colorSpace);
	
	layer.cornerRadius = 3;	
}

@end

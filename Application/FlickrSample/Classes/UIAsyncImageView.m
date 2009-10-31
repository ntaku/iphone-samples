//
//  UIAsyncImageView.m
//  AsyncImage
//
//  Created by ntaku on 09/10/31.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import "UIAsyncImageView.h"
#import "ImageManipulator.h"

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

	// normal image
//	self.image = [UIImage imageWithData:data];

	// rounded image
	self.backgroundColor = [UIColor clearColor];
	UIImage *i = [UIImage imageWithData:data];
	self.image = [ImageManipulator makeRoundCornerImage:i :8 :8];	
	[i release];
	
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

@end

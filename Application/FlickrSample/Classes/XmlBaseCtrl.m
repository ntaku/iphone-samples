//
//  XmlBaseCtrl.m
//  PFrame
//
//  Created by ntaku on 09/10/11.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import "XmlBaseCtrl.h"
#import "XPathQuery.h"

@implementation XmlBaseCtrl

- (void)start:(NSString *)url{
	[self abort];
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
	[self parseDidEnd:data];
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

- (void)parseDidEnd:(NSMutableData *)data{
	
}

- (void)dealloc {
	[conn cancel];
    [conn release];
    [data release];
    [super dealloc];
}

@end

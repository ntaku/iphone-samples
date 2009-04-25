//
//  XPathTest.m
//  XML_libxml2
//
//  Created by ntaku on 09/04/24.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import "XPathTest.h"
#import "XPathQuery.h"


@implementation XPathTest

@synthesize conn, characterBuffer, downloadAndParsePool;

- (void)start{	
	//	NSString *url = @"http://localhost/sample.xml";
	NSString *url = @"http://www.ekidata.jp/api/l/11302.xml";
	[NSThread detachNewThreadSelector:@selector(downloadAndParse:) toTarget:self withObject:[NSURL URLWithString:url]];
}

- (void)downloadAndParse:(NSURL *)url {
	self.downloadAndParsePool = [[NSAutoreleasePool alloc] init];
    self.characterBuffer = [NSMutableData data];
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
	
    conn = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
    done = NO;
	
    if (conn != nil) {
        do {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        } while (!done);
    }
	
    // Release resources used only in this thread.
    self.characterBuffer = nil;
    self.conn = nil;
    [downloadAndParsePool release];
    self.downloadAndParsePool = nil;
}

- (void)parseDidEnd{

	NSArray *data = PerformXMLXPathQuery((NSData *)characterBuffer, @"//station");

	for(int i=0; i<[data count]; i++){		
		NSDictionary *item = [data objectAtIndex:i];
		
		/*		
		 NSEnumerator *keyEnumurator = [item keyEnumerator];
		 id key;
		 while(key = [keyEnumurator nextObject]){
		 NSLog(@"%@ = %@\n", key, [item objectForKey:key]);
		 }
		 NSLog(@"\n");
		 */
		
		NSArray *attr = [item objectForKey:@"nodeAttributeArray"];
		if(attr){			
			for(int k=0; k<[attr count]; k++){
				NSDictionary *item2 = [attr objectAtIndex:k];
				NSString *attrName = [item2 objectForKey:@"attributeName"];
				NSString *attrContent =  [item2 objectForKey:@"nodeContent"];
				NSLog(@"%@ = %@", attrName, attrContent);
			}
		}
		
		NSArray *node = [item objectForKey:@"nodeChildArray"];
		
		for(int j=0; j<[node count]; j++){			
			NSDictionary *item2 = [node objectAtIndex:j];
			NSString *nodeName = [item2 objectForKey:@"nodeName"];
			NSString *nodeContent = [item2 objectForKey:@"nodeContent"];			
			NSLog(@"%@ = %@", nodeName, nodeContent);
			
			NSArray *attr = [item2 objectForKey:@"nodeAttributeArray"];
			if(attr){			
				for(int k=0; k<[attr count]; k++){
					NSDictionary *item3 = [attr objectAtIndex:k];
					NSString *attrName = [item3 objectForKey:@"attributeName"];
					NSString *attrContent =  [item3 objectForKey:@"nodeContent"];
					NSLog(@"%@ - %@ = %@", nodeName, attrName, attrContent);
				}
			}
		}
	}
}


#pragma mark NSURLConnection Delegate methods

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    return nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"connection didFailWithError");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"connection didReceiveData len=%d", [data length]);
	[characterBuffer appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"connectionDidFinishLoading");
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[self parseDidEnd];
}


@end

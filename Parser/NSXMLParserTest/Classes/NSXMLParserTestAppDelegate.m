//
//  NSXMLParserTestAppDelegate.m
//  NSXMLParserTest
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "NSXMLParserTestAppDelegate.h"
#import "XMLReader.h"

@implementation NSXMLParserTestAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	//	NSArray *xmlData = [self getXMLData:@"http://localhost/sample.xml" toObject:@"Contact"];
	NSArray *xmlData = [self getXMLData:@"http://www.ekidata.jp/api/l/11302.xml" toObject:@"station"];
	
	if(xmlData != nil){
		NSLog(@"[ Parse Result ]");
		
		for(int i = 0; i < [xmlData count]; i++){
			NSMutableDictionary *item = [xmlData objectAtIndex:i];
			NSEnumerator *keyEnumurator = [item keyEnumerator];
			id key;
			while(key = [keyEnumurator nextObject]){
				NSLog(@"%@ = %@\n", key, [item objectForKey:key]);
			}
			NSLog(@"\n");
		}
	}
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (NSArray *) getXMLData:(NSString *)url toObject:(NSString *)aClassName{
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSArray *result = nil;
    NSError *error = nil;
	
	XMLReader *parser = [[XMLReader alloc] init];
	[parser parseXMLAtURL:url toObject:aClassName parseError:&error];
	
	if(error != nil){
		NSLog([error description]);
	}else{
		result = [[parser items] retain];
	}
	
	[parser release];	
    [pool release];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	return result;
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

//
//  JsonTestAppDelegate.m
//  JsonTest
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "JsonTestAppDelegate.h"
#import <JSON/JSON.h>

@implementation JsonTestAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	SBJSON *json = [SBJSON new];  
	json.humanReadable = YES;  

	// from NSDictionary to JSON String
	NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
						  @"val1", @"key1",  
						  [[[NSArray alloc] initWithObjects:@"val2", @"val3", nil] autorelease],  @"key2", 
						  nil];  
	NSLog([json stringWithObject:dict error:NULL]);
   
	// from JSON String to NSDictionary
	NSString *jsonString = @"{\"key1\":\"val1\",\"key2\":[\"val2\",\"val3\"]}";  
	
	id jsonObj = [json objectWithString:jsonString error:NULL];  
	if(jsonObj != nil){
		NSLog([json stringWithObject:jsonObj error:NULL]);  
	} 
	
	// from HTTP to NSDictionary
	NSURL *url = [NSURL URLWithString:@"http://localhost/sample.json"];	
	NSString *jsonData = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
	if(jsonData != nil){
		id jsonItem = [jsonData JSONValue];
		NSLog([json stringWithObject:jsonItem error:NULL]);
	}
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

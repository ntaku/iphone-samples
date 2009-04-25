//
//  SQLiteTestAppDelegate.m
//  SQLiteTest
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import "SQLiteTestAppDelegate.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation SQLiteTestAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	[self connectDB];
	
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (void)connectDB{
	// copy sample.db to iPhone Document directory from project directory if it doesn't exist.
	BOOL success;
	NSError *error;	
	NSFileManager *fm = [NSFileManager defaultManager];
	NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"sample.db"];
	
	// delete db file every time.
//	[fm removeItemAtPath:writableDBPath error:&error];

	success = [fm fileExistsAtPath:writableDBPath];
	if(!success){
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"sample.db"];
		success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if(!success){
			NSLog([error localizedDescription]);
		}
	}
	
	// connect db
	FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
	if ([db open]) {
		[db setShouldCacheStatements:YES];
		
		// INSERT
		[db beginTransaction];
		int i = 0;
		while (i++ < 20) {
			[db executeUpdate:@"INSERT INTO TEST (name) values (?)" , [NSString stringWithFormat:@"number %d", i]];			
			if ([db hadError]) {
				NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
			}
		}
		[db commit];
		
		// SELECT
		FMResultSet *rs = [db executeQuery:@"SELECT * FROM TEST"];
		while ([rs next]) {
			NSLog(@"%d %@", [rs intForColumn:@"id"], [rs stringForColumn:@"name"]);
		}
		[rs close];  
		[db close];
	}else{
		NSLog(@"Could not open db.");
	}
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

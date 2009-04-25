//
//  XPathTest.h
//  XML_libxml2
//
//  Created by ntaku on 09/04/24.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XPathTest : NSObject {

    NSURLConnection *conn;
	NSMutableData *characterBuffer;
    NSAutoreleasePool *downloadAndParsePool;
    BOOL done;
}	

@property (nonatomic, retain) NSURLConnection *conn;
@property (nonatomic, retain) NSMutableData *characterBuffer;
@property (nonatomic, assign) NSAutoreleasePool *downloadAndParsePool;

- (void)start;
- (void)downloadAndParse:(NSURL *)url;
- (void)parseDidEnd;

@end

//
//  XMLReader.h
//  XML_NSMLParser
//
//  Created by ntaku on 09/04/23.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XMLReader : NSObject {
	
	NSString *className;
	NSMutableArray *items;
	NSMutableDictionary *item;
	NSString *currentNodeName;
	NSMutableString *currentNodeContent;
}

- (NSArray *) items;
- (id)parseXMLAtURL:(NSString *)url toObject:(NSString *)aClassName parseError:(NSError **)error;

@end

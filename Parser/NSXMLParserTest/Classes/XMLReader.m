//
//  XMLReader.m
//  XML_NSMLParser
//
//  Created by ntaku on 09/04/23.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import "XMLReader.h"


@implementation XMLReader

- (NSArray *) items{
	return items;
}

- (id)parseXMLAtURL:(NSString *)url toObject:(NSString *)aClassName parseError:(NSError **)error{

	[items release];
	items = [[NSMutableArray alloc] initWithCapacity:0];
	
	className = aClassName;
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL: [NSURL URLWithString: url]];
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [parser setDelegate:self];
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
	
	[parser parse];
	
	if([parser parserError] && error){
		*error = [parser parserError];
	}
	
	[parser release];
	return self;
}

- (void) parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName
   namespaceURI:(NSString *)namespaceURI
  qualifiedName:(NSString *)qName
	 attributes:(NSDictionary *)attributeDict{
	
//	NSLog(@"<%@>", elementName);
	
	// parent 
	if([[elementName lowercaseString] isEqualToString:[className lowercaseString]]) {
		item = [[NSMutableDictionary alloc] initWithCapacity:0];

	// children
	} else {
		currentNodeName = [elementName copy];
		currentNodeContent = [[NSMutableString alloc] init];
	}
	
	// attributes
	for (id key in attributeDict){
//		NSLog(@"key: %@, value: %@", key, [attributeDict objectForKey:key]);
		[item setObject:[attributeDict objectForKey:key] forKey:[NSString stringWithFormat:@"attr-%@-%@", elementName, key]];
	}
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName{

//	NSLog(@"  </%@>", elementName);
	
	// parent
	if([[elementName lowercaseString] isEqualToString:[className lowercaseString]]) {
		[items addObject:item];
		[item release];
		item = nil;

	// children
	}else if([[elementName lowercaseString] isEqualToString:[currentNodeName lowercaseString]]) {
		[item setObject:currentNodeContent forKey:elementName];
		
		[currentNodeContent release];
		currentNodeContent = nil;
		
		[currentNodeName release];
		currentNodeName = nil;
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{   
	[currentNodeContent appendString:string];
}

- (void)dealloc{
	[items release];
	[super dealloc];
}

@end

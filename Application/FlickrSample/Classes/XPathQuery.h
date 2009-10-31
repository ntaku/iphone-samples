//
//  XPathQuery.h
//  FuelFinder
//
//  Created by Matt Gallagher on 4/08/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//
// reference
// http://cocoawithlove.com/2008/10/using-libxml2-for-parsing-and-xpath.html

NSArray *PerformHTMLXPathQuery(NSData *document, NSString *query, NSString *ns);
NSArray *PerformXMLXPathQuery(NSData *document, NSString *query, NSString *ns);
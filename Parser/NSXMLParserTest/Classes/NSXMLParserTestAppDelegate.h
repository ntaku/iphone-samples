//
//  NSXMLParserTestAppDelegate.h
//  NSXMLParserTest
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSXMLParserTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (NSArray *) getXMLData:(NSString *)url toObject:(NSString *)aClassName;

@end


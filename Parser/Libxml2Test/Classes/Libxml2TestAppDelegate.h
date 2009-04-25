//
//  Libxml2TestAppDelegate.h
//  Libxml2Test
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

// [NOTE] 
// to use libxml2 library
//	1. add "libxml2.2.dylib" Framwark
//	2. add "/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS2.2.1.sdk/usr/include/libxml2" as Header Search Path

#import <UIKit/UIKit.h>

@interface Libxml2TestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


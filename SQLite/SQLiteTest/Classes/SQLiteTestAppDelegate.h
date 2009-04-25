//
//  SQLiteTestAppDelegate.h
//  SQLiteTest
//
//  Created by ntaku on 09/04/25.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQLiteTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)connectDB;

@end


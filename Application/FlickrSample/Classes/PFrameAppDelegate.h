//
//  PFrameAppDelegate.h
//  PFrame
//
//  Created by ntaku on 09/10/11.
//  Copyright http://d.hatena.ne.jp/ntaku/ 2009. All rights reserved.
//

#define UIAppDelegate (PFrameAppDelegate *)[[UIApplication sharedApplication] delegate]

#import <UIKit/UIKit.h>

@interface PFrameAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

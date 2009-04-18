//
//  LocationViewCtrl.h
//  LocationTest
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationViewCtrl : UIViewController <CLLocationManagerDelegate>{
	
	CLLocationManager *locationMan;

}

@property (nonatomic, retain) CLLocationManager *locationMan;

@end

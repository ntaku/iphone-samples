//
//  LocationViewCtrl.m
//  LocationTest
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import "LocationViewCtrl.h"
#import <CoreLocation/CoreLocation.h>

@implementation LocationViewCtrl

@synthesize locationMan;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	locationMan = [[CLLocationManager alloc] init];
	
	if([locationMan locationServicesEnabled]){	
		locationMan.delegate = self;    
		locationMan.distanceFilter = kCLDistanceFilterNone;
		locationMan.desiredAccuracy = kCLLocationAccuracyBest;
		[locationMan startUpdatingLocation];
	}
}

// GPS update
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	
	CLLocationCoordinate2D coordinate = newLocation.coordinate;
	CLLocationDegrees latitude = coordinate.latitude;
	CLLocationDegrees longitude = coordinate.longitude;
	
	CLLocationAccuracy horizontal = newLocation.horizontalAccuracy;
	CLLocationAccuracy vertical = newLocation.verticalAccuracy;
	
	CLLocationDistance altitude = newLocation.altitude;
	
	NSDate *timestamp = [newLocation timestamp];
	
	// format: <latitude>, <longitude>> +/- <accuracy>m @ <date-time>
	NSLog([newLocation description]);
	
	// distance from before point
	if(oldLocation != nil){
		CLLocationDistance d = [newLocation getDistanceFrom:oldLocation];	
		NSLog([NSString stringWithFormat:@"%f", d]);	
	}
}

// GPS error
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	NSLog([error localizedDescription]);	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

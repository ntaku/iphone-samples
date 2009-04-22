//
//  TableViewCtrl.m
//  SimpleTableView2
//
//  Created by ntaku on 09/04/21.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import "TableViewCtrl.h"
#import "DetailViewCtrl.h"

@implementation TableViewCtrl

@synthesize myTable;

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
	
	self.title = @"TableViewCtrl";
	
	myTable = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	myTable.delegate = self;
	myTable.dataSource = self;
	self.view = myTable;	
}

// how many sections in the table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// how many rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 5;
}

// create table cell view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	cell.text = [NSString stringWithFormat:@"%@ %i", @"row", indexPath.row];
	return cell;
}

// cell selected event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	DetailViewCtrl *ctrl = [[DetailViewCtrl alloc] initWithNibName:nil bundle:nil];
	[self.navigationController pushViewController:ctrl animated:YES];
	[ctrl release];
}

- (void)viewWillAppear:(BOOL)animated {
	NSIndexPath* selection = [myTable indexPathForSelectedRow];
	if(selection){
		[myTable deselectRowAtIndexPath:selection animated:YES];
	}
	[myTable reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
	[self.myTable flashScrollIndicators];
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
	[myTable release];
    [super dealloc];
}


@end

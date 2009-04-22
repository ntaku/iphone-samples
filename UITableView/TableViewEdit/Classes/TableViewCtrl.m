//
//  TableViewCtrl.m
//  TableViewEdit
//
//  Created by ntaku on 09/04/21.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import "TableViewCtrl.h"


@implementation TableViewCtrl

@synthesize myTable, tableData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Custom initialization
		
		tableData = [[NSMutableArray alloc] initWithCapacity:0];
		for(int i=0; i<10; i++){
			[tableData addObject:[NSString stringWithFormat:@"data %d", i]];
		}
		
	}
	return self;
}

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// navigation bar
	[self setEditButton:0];
	
	// table
	myTable = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	myTable.delegate = self;
	myTable.dataSource = self;
	self.view = myTable;
}

- (void)setEditButton:(int)type{

	UIBarButtonItem *right;	
	if(type==0){
		right = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(enterEditMode:)];
	}else{
		right = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(exitEditMode:)];
	}
	self.navigationItem.rightBarButtonItem = right;	
	[right release];
}

// how many sections in the table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// how many rows in the section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [tableData count];
}

// create table cell view
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// enable reorder control
	cell.showsReorderControl = YES;
	
	// accessory
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	cell.text = (NSString *)[tableData objectAtIndex:indexPath.row];
	return cell;
}

// cell selected event
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

// delete event
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableData removeObjectAtIndex:indexPath.row];
	[myTable reloadData];	
}

// reorder event
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)oldPath toIndexPath:(NSIndexPath *)newPath{
	NSString *title = [tableData objectAtIndex:oldPath.row];
	[tableData removeObjectAtIndex:oldPath.row];
	[tableData insertObject:title atIndex:newPath.row];
}

- (void)enterEditMode:(id)sender{
	[myTable setEditing:YES animated:YES];
	[myTable beginUpdates];	
	[self setEditButton:1];
}

- (void)exitEditMode:(id)sender{
	[self setEditButton:0];
	[myTable endUpdates];	
	[myTable setEditing:NO animated:YES];
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
	[tableData release];
	[myTable release];
    [super dealloc];
}


@end

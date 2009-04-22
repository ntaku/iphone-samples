//
//  TableViewCtrl.h
//  TableViewEdit
//
//  Created by ntaku on 09/04/21.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCtrl : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	
	UITableView *myTable;
	NSMutableArray *tableData;
	
}

@property (nonatomic, retain) UITableView *myTable;
@property (nonatomic, retain) NSMutableArray *tableData;

- (void)setEditButton:(int)type;
- (void)enterEditMode:(id)sender;
- (void)exitEditMode:(id)sender;
	
@end

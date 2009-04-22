//
//  TableViewCtrl.h
//  SimpleTableView2
//
//  Created by ntaku on 09/04/21.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewCtrl : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	UITableView *myTable;
	
}

@property (nonatomic, retain) UITableView *myTable;

@end

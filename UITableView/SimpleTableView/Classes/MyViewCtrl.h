//
//  MyViewCtrl.h
//  SimpleTableView
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyViewCtrl : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	UITableView *myTable;
	
}

@property (nonatomic, retain) UITableView *myTable;

@end

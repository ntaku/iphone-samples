//
//  MyTableViewCell.h
//  SimpleTableViewCell
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <UIKit/UIKit.h>

// Identifier
extern NSString *myCellID;

@interface MyTableViewCell : UITableViewCell {
	
	UILabel *title;

}

@property (nonatomic, retain) UILabel *title;

@end

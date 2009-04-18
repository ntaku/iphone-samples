//
//  MyTableViewCell.m
//  SimpleTableViewCell
//
//  Created by ntaku on 09/04/18.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import "MyTableViewCell.h"

NSString *myCellID = @"myCellID";

@implementation MyTableViewCell

@synthesize title;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		
		title = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 0.0, 300.0, 50.0)];
		title.font = [UIFont systemFontOfSize:15];
		[self.contentView addSubview:title];
		
		// accessory type
		self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;		
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[title release];
    [super dealloc];
}


@end

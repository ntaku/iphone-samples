//
//  XmlBaseCtrl.h
//  PFrame
//
//  Created by ntaku on 09/10/11.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XmlBaseCtrl : UIViewController {
	
@private
	NSURLConnection *conn;
	NSMutableData *data;
}

- (void)start:(NSString *)url;
- (void)parseDidEnd:(NSMutableData *)data;
- (void)abort;

@end

//
//  UIAsyncImageView.h
//  AsyncImage
//
//  Created by ntaku on 09/10/31.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIAsyncImageView : UIImageView {

@private
	NSURLConnection *conn;
	NSMutableData *data;
}

-(void)loadImage:(NSString *)url;
-(void)addCorner;
-(void)abort;

@end

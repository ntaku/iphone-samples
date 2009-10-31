//
//  SearchViewCtrl.m
//  PFrame
//
//  Created by ntaku on 09/10/11.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku/. All rights reserved.
//

#import "SearchViewCtrl.h"
#import "XPathQuery.h"
#import "UIAsyncImageView.h"

@implementation SearchViewCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

		thumbnailView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
		thumbnailView.backgroundColor = [UIColor clearColor];
		thumbnailView.contentSize = self.view.frame.size;
		thumbnailView.indicatorStyle = UIScrollViewIndicatorStyleBlack;		
		thumbnailView.clipsToBounds = YES;
		thumbnailView.scrollEnabled = YES;
		thumbnailView.canCancelContentTouches = NO;		
		[self.view addSubview:thumbnailView];		
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	NSString *key = @"YOUR API KEY GOES HERE";
	[self start:[NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.getRecent&per_page=200&api_key=%@", key]];
}

- (void)parseDidEnd:(NSMutableData *)data{
	NSArray *response = PerformXMLXPathQuery((NSData *)data, @"//rsp/photos/photo", nil);
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	int w = 75;
	int mgnx = 4;
	int mgny = 4;
	int basex = mgnx;
	int basey = mgny;	
	
	for(int i=0; i<[response count]; i++){		
		NSArray *attr = [[response objectAtIndex:i] objectForKey:@"nodeAttributeArray"];
		if(attr){
			NSString *fid, *server, *farm, *secret;
			
			for(int k=0; k<[attr count]; k++){
				NSDictionary *item = [attr objectAtIndex:k];
				NSString *name = [item objectForKey:@"attributeName"];
				NSString *body =  [item objectForKey:@"nodeContent"];
				
				if([name isEqualToString:@"id"]){
					fid = body;
				}else if([name isEqualToString:@"secret"]){
					secret = body;
				}else if([name isEqualToString:@"farm"]){
					farm = body;
				}else if([name isEqualToString:@"server"]){
					server = body;
				}
			}

			// create async image view
			UIAsyncImageView *ai = [[UIAsyncImageView alloc] initWithFrame:CGRectMake(basex, basey, w, w)];
			[ai loadImage:[NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg", farm, server, fid, secret]];
			[thumbnailView addSubview:ai];
			[ai release];
		
			basex += w + mgnx;
			if( (i+1)%4 == 0){
				basex = mgnx;
				basey += w + mgny;
			}
		}
	}
	
	// scroll size
	[thumbnailView setContentSize:CGSizeMake(320, basey + mgny)];
	[pool release];
}

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

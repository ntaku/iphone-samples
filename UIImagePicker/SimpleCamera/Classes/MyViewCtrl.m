//
//  MyViewCtrl.m
//  SimpleCamera
//
//  Created by ntaku on 09/04/22.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//

#define TOOLBAR_HEIGHT 48

#import "MyViewCtrl.h"

@implementation MyViewCtrl

@synthesize imgPicker, toolbar, btnTakePhoto, btnShowLibrary, imageView;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
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

	// create image picker
	imgPicker = [[UIImagePickerController alloc] init];
	imgPicker.allowsImageEditing = YES;
	imgPicker.delegate = self;

	// image view
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460-TOOLBAR_HEIGHT)];
	[self.view addSubview:imageView];
	
	// toolbar
	toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 460-TOOLBAR_HEIGHT, 320, TOOLBAR_HEIGHT)];
	[self.view addSubview:toolbar];
	
	btnTakePhoto = [[UIBarButtonItem alloc] 
					initWithTitle:@"Camera" 
					style:UIBarButtonItemStylePlain 
					target:self 
					action:@selector(takePhoto:)];

	btnShowLibrary = [[UIBarButtonItem alloc] 
					initWithTitle:@"Library" 
					style:UIBarButtonItemStylePlain 
					target:self 
					action:@selector(showLibrary:)];
	
	[toolbar setItems:[NSArray arrayWithObjects:btnTakePhoto, btnShowLibrary, nil]];
}

- (void) takePhoto:(id)sender{
	UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypeCamera;
	if([UIImagePickerController isSourceTypeAvailable:type]){
		imgPicker.sourceType = type;
		[self presentModalViewController:imgPicker animated:YES];	
	}
}

- (void) showLibrary:(id)sender{
	UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//	UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;

	if([UIImagePickerController isSourceTypeAvailable:type]){
		imgPicker.sourceType = type;
		[self presentModalViewController:imgPicker animated:YES];	
	}
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
	[self dismissModalViewControllerAnimated:YES];
	
	UIImage *original;
	original = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
	
	CGSize size = {320, 460-TOOLBAR_HEIGHT};
	UIGraphicsBeginImageContext(size);
	
	CGRect rect;
	rect.origin = CGPointZero;
	rect.size = size;
	[original drawInRect:rect];
	
	UIImage *shinked;
	shinked = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	imageView.image = shinked;	
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	[self dismissModalViewControllerAnimated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[imgPicker release];
	[toolbar release];
	[btnTakePhoto release];
	[btnShowLibrary release];
	[imageView release];
    [super dealloc];
}


@end

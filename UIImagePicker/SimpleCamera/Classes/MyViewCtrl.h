//
//  MyViewCtrl.h
//  SimpleCamera
//
//  Created by ntaku on 09/04/22.
//  Copyright 2009 http://d.hatena.ne.jp/ntaku. All rights reserved.
//
//	reference site
//	http://journal.mycom.co.jp/column/iphone/001/index.html

#import <UIKit/UIKit.h>


@interface MyViewCtrl : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
	
	UIImagePickerController *imgPicker;
	UIToolbar *toolbar;
	UIBarButtonItem *btnTakePhoto;
	UIBarButtonItem *btnShowLibrary;
	UIImageView *imageView;

}

@property (nonatomic, retain) UIImagePickerController *imgPicker;
@property (nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) UIBarButtonItem *btnTakePhoto;
@property (nonatomic, retain) UIBarButtonItem *btnShowLibrary;
@property (nonatomic, retain) UIImageView *imageView;

- (void) takePhoto:(id)sender;
- (void) showLibrary:(id)sender;

@end

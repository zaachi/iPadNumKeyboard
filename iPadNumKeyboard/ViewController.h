//
//  ViewController.h
//  iPadNumKeyboard
//
//  Created by Jiri Zachar on 14.08.15.
//  Copyright (c) 2015 Jiri Zachar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *inputTextField;
@property (nonatomic, retain) IBOutlet UITextView *inputTextView;
@end



/*

iPadNumKeyboard 

iPadNumKeyboard is numeric keyboard for iPad, whitch works with UITextField or UITextView. 

/// image ///
 
Usage

Include this files into your project: 
 
iPadNumKeyboard.h
iPadNumKeyboard.m
iPadNumKeyboard.xib
iPadNumberKeyboardImages.xcassets
 
iPadNumberKeyboardImages contains images
 
In code you can use it simple: 
 
iPadNumKeyboard *keyboard = [iPadNumKeyboard new];
inputTextView.inputView = keyboard;


Modify keyboard

- set buttons title: 

 [keyboard setSuccessTitle:@"Next"];
 [keyboard setCancelTitle:@"Cancel"];

- hide buttons:

 [keyboard hideCancelButton];
 
 
 - add custom targets: 
 
 [keyboard.successButton addTarget:self action:@selector(successClick:) forControlEvents:UIControlEventTouchUpInside];
 [keyboard.cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];

Change design
 
If you want to change the design of the keyboard, you can edit images in a file iPadNumberKeyboardImages.xcassets  or change the layout in iPadNumKeyboard.xib file.
 
Licence
 
MIT License (MIT)
*/
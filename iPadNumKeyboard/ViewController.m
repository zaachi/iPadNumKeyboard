//
//  ViewController.m
//  iPadNumKeyboard
//
//  Created by Jiri Zachar on 14.08.15.
//  Copyright (c) 2015 Jiri Zachar. All rights reserved.
//

#import "ViewController.h"
#import "iPadNumKeyboard.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize inputTextField;
@synthesize inputTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    //create keyboard
    iPadNumKeyboard *keyboard = [iPadNumKeyboard new];

    //set button title
    [keyboard setSuccessTitle:@"Next"];
    [keyboard setCancelTitle:@"Cancel"];

    //hide button
    //[keyboard hideCancelButton];

    //add targets
    [keyboard.successButton addTarget:self action:@selector(successClick:) forControlEvents:UIControlEventTouchUpInside];
    [keyboard.cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];

    //set input view into text fields
    inputTextField.inputView = keyboard;
    inputTextView.inputView = keyboard;
    
    //show keyboard
    [inputTextField becomeFirstResponder];
}

//success action
-(IBAction)successClick:(id)sender{
    NSLog(@"confirmed");
    NSLog(@"inputTextField value is: %@", inputTextField.text);
    NSLog(@"inputTextView value is: %@", inputTextView.text);

    if ([inputTextView.text isEqualToString:@""]) {
        [inputTextView becomeFirstResponder];
    }
    else if ([inputTextField.text isEqualToString:@""]) {
        [inputTextField becomeFirstResponder];
    }
}

//cancel action
-(IBAction)cancelClick:(id)sender{
    NSLog(@"cancel");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

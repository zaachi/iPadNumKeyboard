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

    iPadNumKeyboard *keyboard = [iPadNumKeyboard new];

    inputTextField.inputView = keyboard;
    inputTextView.inputView = keyboard;
    
    //show keyboard
    [inputTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

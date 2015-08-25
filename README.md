# iPadNumKeyboard

iPadNumKeyboard is numeric keyboard for iPad, whitch works with UITextField or UITextView. 

![alt tag](https://github.com/zaachi/iPadNumKeyboard/blob/master/readmeImages/ipadkey.gif?raw=true)
 
# Usage

Include this files into your project: 
 
- iPadNumKeyboard.h
- iPadNumKeyboard.m
- iPadNumKeyboard.xib
- iPadNumberKeyboardImages.xcassets
 
File iPadNumberKeyboardImages contains design and images. 
 
In code you can use it simple: 


    iPadNumKeyboard *keyboard = [iPadNumKeyboard new];
    inputTextView.inputView = keyboard;


# Modify keyboard

Set buttons title: 


    [keyboard setSuccessTitle:@"Next"];
    [keyboard setCancelTitle:@"Cancel"];

Hide buttons:


    [keyboard hideCancelButton];

Add custom targets: 


    [keyboard.successButton addTarget:self action:@selector(successClick:) forControlEvents:UIControlEventTouchUpInside];
    [keyboard.cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];

![alt tag](https://github.com/zaachi/iPadNumKeyboard/blob/master/readmeImages/ipadkey.png?raw=true)

# Design

Design by Vojta Holik (komox). 

If you want to change the design of the keyboard, you can edit images in a file iPadNumberKeyboardImages.xcassets  or change the layout in iPadNumKeyboard.xib file.
 
# Licence
 
MIT License (MIT)

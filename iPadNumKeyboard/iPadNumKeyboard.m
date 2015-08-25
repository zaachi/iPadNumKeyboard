//
//  iPadNumKeyboard.m
//  iPadNumKeyboard
//
//  Created by Jiri Zachar on 14.08.15.
//  Copyright (c) 2015 Jiri Zachar. All rights reserved.
//

#import "iPadNumKeyboard.h"

@interface iPadNumKeyboard ()

@property (nonatomic, weak) UIResponder <UITextInput> *targetTextInput;

@end

@implementation iPadNumKeyboard

@synthesize numberButton;
@synthesize targetTextInput;
@synthesize successButton;
@synthesize cancelButton;

-(id)init{
    static iPadNumKeyboard *keyboard = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        keyboard = [[[NSBundle mainBundle] loadNibNamed:@"iPadNumKeyboard" owner:self options:nil] objectAtIndex:0];
    });

    return keyboard;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addObservers];
        }
    return self;
}

- (void)addObservers {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidBegin:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidBegin:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidEnd:) name:UITextViewTextDidEndEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidEnd:) name:UITextViewTextDidEndEditingNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editTextChange:) name:UITextViewTextDidChangeNotification object:nil];
}

-(void)numberClickAction: (long) val{
    if (self.targetTextInput) {
        if ([self.targetTextInput isKindOfClass:[UITextField class]]) {
            UITextField *temp = (UITextField *)self.targetTextInput;
            temp.text = [temp.text stringByAppendingString:[NSString stringWithFormat:@"%ld", val]];
        }else if ([self.targetTextInput isKindOfClass:[UITextView class]]) {
            UITextView *temp = (UITextView *)self.targetTextInput;
            temp.text = [temp.text stringByAppendingString:[NSString stringWithFormat:@"%ld", val]];
        }
    }
}

-(IBAction)removeButtonClick:(id)sender{
    if (self.targetTextInput) {
        if ([self.targetTextInput isKindOfClass:[UITextField class]]) {
            UITextField *temp = (UITextField *)self.targetTextInput;
            if ([temp.text length]) {
                temp.text = [temp.text substringToIndex:[temp.text length]-1];
            }
        }else if ([self.targetTextInput isKindOfClass:[UITextView class]]) {
            UITextView *temp = (UITextView *)self.targetTextInput;
            if ([temp.text length]) {
                temp.text = [temp.text substringToIndex:[temp.text length]-1];
            }
        }
    }
}

-(void)hideKeyboardAction{
    [self.targetTextInput resignFirstResponder];
}

-(IBAction)hideKeyboard:(id)sender{
    [self hideKeyboardAction];
}

-(IBAction)numberButtonClick:(id)sender{
    int tag = [sender tag];
    if (tag < 10) {
        [self numberClickAction:tag];
    }
}

-(void)setSuccessTitle:(NSString *)title{
    [successButton setTitle:title forState:UIControlStateNormal];
}

-(void)setCancelTitle :(NSString *)title{
    [cancelButton setTitle:title forState:UIControlStateNormal];
}


-(IBAction)cancelButtonClick:(id)sender{
    //first hide keyboard
    [self hideKeyboardAction];
}

-(IBAction)successButtonClick:(id)sender{
    //first hide keyboard
    [self hideKeyboardAction];
}

- (void)editingDidEnd:(NSNotification *)notification {
    self.targetTextInput = nil;
}

-(void)hideCancelButton{
    self.cancelButton.hidden = YES;
    self.successButton.frame = CGRectMake(cancelButton.frame.origin.x, cancelButton.frame.origin.y, cancelButton.frame.size.width+successButton.frame.size.width, successButton.frame.size.height);
}

-(void)hideSuccessButton{
    self.successButton.hidden = YES;
}

- (void)editingDidBegin:(NSNotification *)notification {
    if ([notification.object isKindOfClass:[UITextView class]] || [notification.object isKindOfClass:[UITextField class]]) {
        self.targetTextInput = notification.object;
    }else{
        self.targetTextInput = nil;
    }
}

@end

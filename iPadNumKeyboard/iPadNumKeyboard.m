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

-(IBAction)numberButtonClick:(id)sender{
    if (self.targetTextInput) {
        UITextField *temp = (UITextField *)targetTextInput;
        temp.text = [temp.text stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)[sender tag]]];
    }
}

- (void)editingDidEnd:(NSNotification *)notification {
    self.targetTextInput = nil;
}

- (void)editingDidBegin:(NSNotification *)notification {
    if ([notification.object isKindOfClass:[UITextView class]] || [notification.object isKindOfClass:[UITextField class]]) {
        self.targetTextInput = notification.object;
    }else{
        self.targetTextInput = nil;
    }
}

@end

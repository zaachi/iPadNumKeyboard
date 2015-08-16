//
//  iPadNumKeyboard.h
//  iPadNumKeyboard
//
//  Created by Jiri Zachar on 14.08.15.
//  Copyright (c) 2015 Jiri Zachar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPadNumKeyboard : UIView

@property (nonatomic, retain) IBOutlet UIButton *numberButton;
@property (nonatomic, retain) IBOutlet UIButton *successButton;
@property (nonatomic, retain) IBOutlet UIButton *cancelButton;

-(IBAction)numberButtonClick:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

-(IBAction)successButtonClick:(id)sender;
-(IBAction)cancelButtonClick:(id)sender;

-(void)setSuccessTitle:(NSString *)title;
-(void)setCancelTitle :(NSString *)title;

-(void)hideCancelButton;
-(void)hideSuccessButton;


@end

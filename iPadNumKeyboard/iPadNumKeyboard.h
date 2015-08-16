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

-(IBAction)numberButtonClick:(id)sender;
@end

//
//  LDNewReasonViewController.h
//  Looking Down
//
//  Created by Austin Feight on 1/10/14.
//  Copyright (c) 2014 Lost in Flight Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDNewReasonViewController : UIViewController <UIAlertViewDelegate>

- (IBAction)sendReason:(id)sender;
- (IBAction)cancel:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *titleInput;
@property (strong, nonatomic) IBOutlet UITextView *descriptionInput;

@end

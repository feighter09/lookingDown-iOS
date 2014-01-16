//
//  LDNewReasonViewController.m
//  Looking Down
//
//  Created by Austin Feight on 1/10/14.
//  Copyright (c) 2014 Lost in Flight Studios. All rights reserved.
//

#import "LDNewReasonViewController.h"

#import <Parse/Parse.h>
#import "MBProgressHUD.h"

@interface LDNewReasonViewController ()

@end

@implementation LDNewReasonViewController

#pragma mark - Nav button handling

- (IBAction)sendReason:(id)sender {
  [self.view endEditing:YES];
  
  PFObject *reason = [PFObject objectWithClassName:@"HisReason"];
  reason[@"text"] = [_titleInput text];
  reason[@"longText"] = [_descriptionInput text];
  
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  [reason saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if (succeeded) {
      [MBProgressHUD hideHUDForView:self.view animated:YES];
      [[[UIAlertView alloc] initWithTitle:@"Success!"
                                  message:@"Message sent successfully"
                                 delegate:self
                        cancelButtonTitle:@"Ok"
                        otherButtonTitles:nil] show];
    } else {
      [MBProgressHUD hideHUDForView:self.view animated:YES];
      [[[UIAlertView alloc] initWithTitle:@"Uh oh"
                                  message:@"Sorry Cassie, something went wrong sending the message. Could you try again?"
                                 delegate:self
                        cancelButtonTitle:@"Ok"
                        otherButtonTitles:nil] show];
    }
  }];
}

- (IBAction)cancel:(id)sender {
  [self dismissViewControllerAnimated:YES completion:nil];
  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Alert handling

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ([[alertView title] isEqualToString:@"Success!"]) {
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
  }
}

@end

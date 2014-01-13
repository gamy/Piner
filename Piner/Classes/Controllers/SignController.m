//
//  SignController.m
//  Piner
//
//  Created by Gamy on 13-12-29.
//  Copyright (c) 2013年 Piner. All rights reserved.
//

#import "SignController.h"
#import "NSString+Validate.h"
#import "PinService.h"

@interface SignController ()
- (IBAction)signup:(id)sender;
- (IBAction)signin:(id)sender;
- (IBAction)cancel:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIView *holderView;
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation SignController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (void)presentFromController:(UIViewController *)controller
{
    SignController *sc = [[SignController alloc] init];
    [controller presentViewController:sc animated:YES completion:NULL];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.holderView setBackgroundColor:[UIColor whiteColor]];
    [self.holderView setRoundCorner:6 border:1 borderColor:[UIColor lightGrayColor]];
    [UIFactory updateAccessButton:self.signinButton];
    [UIFactory updateOptionalButton:self.signupButton];
    [self.cancelButton setTitleColor:[KXKiOS7Colors lightGrey] forState:UIControlStateNormal];
    
//    [self.accountField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define MIN_INPUT_LENGTH 6
#define MAX_INPUT_LENGTH 16

- (BOOL)checkFields
{
    if(![[self account] isValidAccount]){
        return NO;
    }
    if (![[self password] checkMinLength:MIN_INPUT_LENGTH maxLength:MAX_INPUT_LENGTH]) {
        return NO;
    }
    return YES;
}

- (NSString *)account
{
    return _accountField.text;
}

- (NSString *)password
{
    return _passwordField.text;
}

- (IBAction)signup:(id)sender {
    if ([self checkFields]) {
        [[PinService sharedService] signup:[self account] password:[self password] callback:^(NSError *error, id object) {
            if (!error) {
                User *user = object;
                NSLog(@"user.name = %@", user.name);
//                [self dismissViewControllerAnimated:YES completion:NULL];
            }
        }];
    }
}

- (IBAction)signin:(id)sender {
    if ([self checkFields]) {
        [[PinService sharedService] signin:[self account] password:[self password] callback:^(NSError *error, id object) {
            if (!error) {
                User *user = object;
                NSLog(@"user.name = %@", user.name);
//                [self dismissViewControllerAnimated:YES completion:NULL];
            }
        }];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NO];
}
@end

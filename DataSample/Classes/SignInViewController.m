//
//  Copyright (C) 2014 Pivotal Software, Inc. All rights reserved.
//

#import <MSSData/MSSDataSignIn.h>

#import "SignInViewController.h"

static NSString *const kOAuthServerURL = @"http://ident.one.pepsi.cf-app.com";
static NSString *const kDataServiceURL = @"http://data-service.one.pepsi.cf-app.com";

static NSString *const kClientID = @"ios-client";
static NSString *const kClientSecret = @"006d0cea91f01a82cdc57afafbbc0d26c8328964029d5b5eae920e2fdc703169";

@interface SignInViewController () <MSSSignInDelegate>

@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@end

@implementation SignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MSSDataSignIn *instance = [MSSDataSignIn sharedInstance];
    instance.clientID = kClientID;
    instance.clientSecret = kClientSecret;
    instance.openIDConnectURL = kOAuthServerURL;
    instance.dataServiceURL = kDataServiceURL;
    instance.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInClick:(id)sender {
    [[MSSDataSignIn sharedInstance] authenticate];
}

- (IBAction)signOutClicked:(id)sender {
    [[MSSDataSignIn sharedInstance] signOut];
}

- (void)finishedWithAuth:(AFOAuthCredential *)auth
                   error:(NSError *)error
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign In Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DataTableViewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }
}


@end

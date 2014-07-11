//
//  SignInViewController.m
//  DataServices Example
//
//  Created by Elliott Garcea on 2014-06-06.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "DataSyncSignIn.h"

#import "SignInViewController.h"

static NSString *const kOAuthServerURL = @"http://ident.one.pepsi.cf-app.com";
static NSString *const kDataServiceURL = @"http://data-service.one.pepsi.cf-app.com";

static NSString *const kClientID = @"739e8ae7-e518-4eac-b100-ceec2dd65459";
static NSString *const kClientSecret = @"AON8owWAztcnrnWDyOb1j_WOIS0LrnFbVoAzUATAYEjO92LGaq4ZG60-TCAxM6hAStfdrj9rY29_t6dJ_yO2Vno";

@interface SignInViewController () <SignInDelegate>

@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@end

@implementation SignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DataSyncSignIn *instance = [DataSyncSignIn sharedInstance];
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
    [[DataSyncSignIn sharedInstance] authenticate];
}

- (IBAction)signOutClicked:(id)sender {
    [[DataSyncSignIn sharedInstance] signOut];
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

//
//  ViewController.m
//  PCFDataSample
//
//  Created by DX122-XL on 2014-11-28.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <PCFData/PCFData.h>
#import <PCFAuth/PCFAuth.h>

@implementation ViewController

static NSString* const PCFDataRequestCache = @"PCFData:RequestCache";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [PCFData logLevel:PCFDataLogLevelDebug];
    [PCFAuth logLevel:PCFAuthLogLevelDebug];
    
    self.object = [[PCFKeyValueObject alloc] initWithCollection:@"objects" key:@"key"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults addObserver:self forKeyPath:PCFDataRequestCache options:NSKeyValueObservingOptionNew context:0];
}

- (void)dealloc {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObserver:self forKeyPath:PCFDataRequestCache];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isKindOfClass:[NSUserDefaults class]]) {
        if ([keyPath isEqualToString:PCFDataRequestCache]) {
            NSString *content = [object objectForKey:PCFDataRequestCache];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"%@ changed.", PCFDataRequestCache);
                
                self.cachedContent.text = content;
            });
        }
    }
}

- (IBAction)fetchObject:(id)sender {
    [PCFAuth tokenWithBlock:^(NSString *token) {
        [self.object getWithAccessToken:token force:self.force completionBlock:^(PCFResponse *response) {
            [self handleResponse:response];
        }];
    }];
}

- (IBAction)saveObject:(id)sender {
    [PCFAuth tokenWithBlock:^(NSString *token) {
        [self.object putWithAccessToken:token value:self.textField.text force:self.force completionBlock:^(PCFResponse *response) {
            [self handleResponse:response];
        }];
    }];
}

- (IBAction)deleteObject:(id)sender {
    [PCFAuth tokenWithBlock:^(NSString *token) {
        [self.object deleteWithAccessToken:token force:self.force completionBlock:^(PCFResponse *response) {
            [self handleResponse:response];
        }];
    }];
}

- (BOOL)force {
    return !self.etagSwitch.isOn;
}

- (void)handleResponse:(PCFResponse *)response {

    PCFKeyValue *keyValue = (PCFKeyValue *)response.object;
    
    self.textField.text = keyValue.value;
    
    if (response.error) {
        NSLog(@"PCFResponse error: %@", response.error);
        
        NSString *errorCode = [NSString stringWithFormat: @"%d", (int) response.error.code];
        
        if (errorCode == nil || [errorCode isEqual:@""]) {
            errorCode = @"none";
        }
        
        NSString *errorDescription = [[response error] localizedDescription];
        
        if (errorDescription == nil) {
            errorDescription = @"";
        }
        
        [self.errorLabel setText:[NSString stringWithFormat:@"Error Code: %@\n\nDescription: %@", errorCode, errorDescription]];
    } else {
        NSLog(@"PCFResponse value: %@", keyValue.value);
        
        [self.errorLabel setText:@""];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end

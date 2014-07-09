//
//  MSSShowJSONViewController.m
//  MSSDataServices Example
//
//  Created by Elliott Garcea on 2014-06-11.
//  Copyright (c) 2014 Pivotal. All rights reserved.
//

#import "MSSShowJSONViewController.h"

@interface MSSShowJSONViewController ()

@property (weak, nonatomic) IBOutlet UITextView *showJSONTextView;

@end

@implementation MSSShowJSONViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.showJSONTextView setText:self.formattedJSON];
}

@end

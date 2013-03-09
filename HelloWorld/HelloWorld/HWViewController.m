//
//  HWViewController.m
//  HelloWorld
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideView:(id)sender {
    [UIView beginAnimations:nil context:nil];
    self.workingView.alpha = 0;
    [UIView commitAnimations];
}

- (IBAction)showView:(id)sender {
    [UIView beginAnimations:nil context:nil];
    self.workingView.alpha = 1;
    [UIView commitAnimations];
}
- (void)dealloc {
    [_workingView release];
    [super dealloc];
}
@end

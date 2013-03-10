//
//  OpcoesController.m
//  ViewControllerAnimations
//
//  Created by Lucas Augusto da Silva on 2013-03-10.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "OpcoesController.h"

@interface OpcoesController ()

@end

@implementation OpcoesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end

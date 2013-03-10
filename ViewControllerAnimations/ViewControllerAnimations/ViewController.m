//
//  ViewController.m
//  ViewControllerAnimations
//
//  Created by Lucas Augusto da Silva on 2013-03-09.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ViewController.h"
#import "OpcoesController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (void)mostraControllerComAnimacao:(UIModalTransitionStyle) estilo {
    OpcoesController *c = [[OpcoesController alloc] init];
    
    c.modalTransitionStyle = estilo;
    
    [self presentModalViewController:c animated:YES];
    [c release];
}

- (IBAction)showDissolve:(id)sender {
    [self mostraControllerComAnimacao:UIModalTransitionStyleCrossDissolve];
}

- (IBAction)showPageCurl:(id)sender {
    [self mostraControllerComAnimacao:UIModalTransitionStylePartialCurl];
}

- (IBAction)showVertical:(id)sender {
    [self mostraControllerComAnimacao:UIModalTransitionStyleCoverVertical];
}

- (IBAction)showHorizontal:(id)sender {
    [self mostraControllerComAnimacao:UIModalTransitionStyleFlipHorizontal];
}
@end

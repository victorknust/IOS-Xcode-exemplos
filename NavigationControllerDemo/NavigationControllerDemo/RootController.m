//
//  ViewController.m
//  NavigationControllerDemo
//
//  Created by Lucas Augusto da Silva on 2013-03-10.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "RootController.h"
#import "AdicionarController.h"
#import "ConfiguracoesController.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Root Controller";
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)abrirAdicionar:(id)sender {
    AdicionarController *c = [[AdicionarController alloc] init];
    
    [self.navigationController pushViewController:c animated:YES];
    [c release];
}

- (IBAction)abrirConfiguracoes:(id)sender {
    ConfiguracoesController *c = [[ConfiguracoesController alloc] init];
    
    [self.navigationController pushViewController:c animated:YES];
    [c release];
}
@end

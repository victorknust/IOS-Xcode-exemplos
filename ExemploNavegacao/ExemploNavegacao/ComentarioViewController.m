//
//  ComentarioViewController.m
//  ExemploNavegacao
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ComentarioViewController.h"

@implementation ComentarioViewController
@synthesize textView;

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
    
    UIBarButtonItem *btnSalvar = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStyleBordered target:self action:@selector(salvar)];
    
    self.navigationItem.rightBarButtonItem = btnSalvar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dismissKeyboard{
    if (self.textView) [self.textView resignFirstResponder];
}

-(void) salvar{
    [self dismissKeyboard];
}

@end

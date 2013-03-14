//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ViewController.h"
#import "ExibeCatalogoController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.avisoSucessoLabel.hidden = YES;
    self.title = @"Cadastro de Empresa";
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                  target:self
                                  action:@selector(menuButtonPressed)];
    
    UIBarButtonItem *barButton2 = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                  target:self
                                  action:@selector(menuButtonPressed)];
    
    [[self navigationItem] setRightBarButtonItem:barButton];
    [[self navigationItem] setLeftBarButtonItem:barButton2];
    [barButton release];
}

- (void) viewWillAppear:(BOOL)animated{
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)menuButtonPressed{
    UIAlertView *alert = [[[UIAlertView alloc]
                           initWithTitle:@"Contato"
                           message:@"Mensagem" delegate:nil
                           cancelButtonTitle:@"OK"
                           otherButtonTitles:nil] autorelease];
    [alert show];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nomeFiled release];
    [_quantidadeField release];
    [_avisoSucessoLabel release];
    [super dealloc];
}

- (void) salvaEmpresa:(Empresa *)novaEmpresa {
    if (!catalogo){
        catalogo = [[NSMutableArray alloc] init];
    }
    
    [catalogo addObject:novaEmpresa];
}

- (void) mostraCatalogo {
    ExibeCatalogoController *c = [[ExibeCatalogoController alloc] init];
    c.catalogo = catalogo;
    [self.navigationController pushViewController:c animated:YES];
    [c release];
}

- (IBAction)salvar:(id)sender {
    
    [self.nomeFiled resignFirstResponder];
    
    Empresa *e = [[Empresa alloc] init];
    e.nome = self.nomeFiled.text;
    e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
    
    [self salvaEmpresa:e];
    [self mostraCatalogo];
    
    [e release];
    
    self.avisoSucessoLabel.alpha = 0;
    [UIView animateWithDuration:1 animations:^{
        self.avisoSucessoLabel.hidden = NO;
        self.avisoSucessoLabel.alpha = 1;
    } completion:^(BOOL finalizado) {
        [UIView animateWithDuration:1 delay:2 options:0 animations:^{
            self.avisoSucessoLabel.alpha = 0;
        } completion:^(BOOL finalizado) {
            self.avisoSucessoLabel.hidden = YES;
        }];
    }];
}

- (IBAction)incrementadorAlterado:(id)sender {
    UIStepper *incrementador = (UIStepper *)sender;
    self.quantidadeField.text = [NSString stringWithFormat:@"%d", (int)incrementador.value];
    
    [self.nomeFiled resignFirstResponder];
}
@end

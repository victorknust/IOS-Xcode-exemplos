//
//  ViewController.m
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.avisoSucessoLabel.hidden = YES;
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
    NSLog(@"******* Listando todas empresas *******");
    
    for (Empresa *empresa in catalogo) {
        NSLog(@"A empresa %@  tem %d funcionários", empresa.nome, empresa.quantidadeFuncionarios);
    }
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
}
@end

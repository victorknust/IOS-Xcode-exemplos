//
//  ViewController.m
//  TableViewSimpleContactList
//
//  Created by Lucas Augusto da Silva on 2013-03-11.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadContacts];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tabelaContatos release];
    [super dealloc];
}

-(void) loadContacts{
    NSString *plistCaminho = [[NSBundle mainBundle] pathForResource:@"contatos" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
    NSArray *dados = [pl objectForKey:@"contatos"];
    
    contatos = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados) {
        
        NSString *nome = [item objectForKey:@"nome"];
        NSString *telefone = [item objectForKey:@"telefone"];
        
        Contato *c = [[Contato alloc] initWithNome:nome andTelefone:telefone];
        
        [contatos addObject:c];
        [c release];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contatos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaContatoCacheID = @"CelulaContatoCacheID";
    
    UITableViewCell *cell = [self.tabelaContatos dequeueReusableCellWithIdentifier:CelulaContatoCacheID];
    
    if (!cell){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CelulaContatoCacheID] autorelease];
    }
    
    Contato *contato = [contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    cell.detailTextLabel.text = contato.telefone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Contato *contato = [contatos objectAtIndex:indexPath.row];
    
    NSString *msg = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", contato.nome, contato.telefone];
    
    UIAlertView *alert = [[[UIAlertView alloc]
                           initWithTitle:@"Contato"
                           message:msg delegate:nil
                           cancelButtonTitle:@"OK"
                           otherButtonTitles:nil] autorelease];
    [alert show];
    
    [self.tabelaContatos deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [contatos removeObjectAtIndex:indexPath.row];
    [self.tabelaContatos reloadData];
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remover";
}

- (IBAction)botaoEditarTap:(id)sender {
    if ([self.botaoEditar.title isEqualToString:@"Editar"]) {
        [self.tabelaContatos setEditing:YES animated:YES];
        self.botaoEditar.title = @"Pronto";
    }else {
        [self.tabelaContatos setEditing:NO animated:YES];
        self.botaoEditar.title = @"Editar";
    }
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

@end

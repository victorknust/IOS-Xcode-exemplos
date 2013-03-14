//
//  ExibeCatalogoControllerViewController.m
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-13.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ExibeCatalogoController.h"
#import "Empresa.h"

@interface ExibeCatalogoController ()

@end

@implementation ExibeCatalogoController
@synthesize tabela, catalogo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return catalogo.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaContatoCacheID = @"CelulaContatoCacheID";
    
    UITableViewCell *cell = [self.tabela dequeueReusableCellWithIdentifier:CelulaContatoCacheID];
    
    if (!cell){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CelulaContatoCacheID] autorelease];
    }
    
    Empresa *e = [catalogo objectAtIndex:indexPath.row];
    cell.textLabel.text = e.nome;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Quantidade de funcionários: %d", e.quantidadeFuncionarios];

    
    return cell;

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

- (void)dealloc {
    [tabela release];
    [super dealloc];
}
@end

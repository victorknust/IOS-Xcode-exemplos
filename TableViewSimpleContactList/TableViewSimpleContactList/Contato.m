//
//  Contato.m
//  TableViewSimpleContactList
//
//  Created by Lucas Augusto da Silva on 2013-03-11.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "Contato.h"

@implementation Contato
@synthesize nome, telefone;

-(id)initWithNome:(NSString *)nomeInicial andTelefone:(NSString *)telefoneInicial{
    if ((self = [super init])){
        self.nome = nomeInicial;
        self.telefone = telefoneInicial;
    }
    
    return self;
}

-(void)dealloc{
    [nome release];
    [telefone release];
    [super dealloc];
}

@end

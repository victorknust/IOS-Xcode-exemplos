//
//  Empresa.m
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "Empresa.h"

@implementation Empresa
@synthesize nome, quantidadeFuncionarios;

- (void) dealloc {
    [nome release];
    [super dealloc];
}

@end

//
//  Empresa.h
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Empresa : NSObject{
    NSString *nome;
    int quantidadeFuncionarios;
}

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, assign) int quantidadeFuncionarios;

@end

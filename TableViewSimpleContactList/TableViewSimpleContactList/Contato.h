//
//  Contato.h
//  TableViewSimpleContactList
//
//  Created by Lucas Augusto da Silva on 2013-03-11.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject{
    NSString *nome;
    NSString *telefone;
}

-(id) initWithNome:(NSString *) nomeInicial andTelefone:(NSString *) telefoneInicial;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *telefone;

@end

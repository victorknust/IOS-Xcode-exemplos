//
//  GerenciadorBD.h
//  ExemploNavegacao
//
//  Created by Fabio Marzullo on 27/12/11.
//  Copyright (c) 2011 MZ Soluções em Gestão Empresarial Ltda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Favoritos.h"

@interface GerenciadorBD : NSObject

+ (NSManagedObjectContext *)managedObjectContext;
+ (void)setManagedObjectContext:(NSManagedObjectContext *)context;

+(void) salvar:(NSString *) url;
+(NSArray*) listarTodos;

@end

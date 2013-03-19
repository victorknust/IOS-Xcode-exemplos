//
//  GerenciadorBD.m
//  ExemploNavegacao
//
//  Created by Fabio Marzullo on 27/12/11.
//  Copyright (c) 2011 MZ Soluções em Gestão Empresarial Ltda. All rights reserved.
//

#import "GerenciadorBD.h"
#import "Favoritos.h"

@implementation GerenciadorBD


static NSManagedObjectContext *managedObjectContext;

+ (NSManagedObjectContext *)managedObjectContext { 
    return managedObjectContext; 
}

+ (void)setManagedObjectContext:(NSManagedObjectContext *)context { 
    managedObjectContext = context; 
}

+ (void)salvar:(NSString *) url
{
    
    Favoritos *cm = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	request.entity = [NSEntityDescription entityForName:@"Favoritos" inManagedObjectContext:self.managedObjectContext];
	request.predicate = [NSPredicate predicateWithFormat:@"url = %@", url];
	
	NSError *error = nil;
	cm = [[self.managedObjectContext executeFetchRequest:request error:&error] lastObject];
		
    if (error) {NSLog(@"%@",error.description);} 
    
	if (!cm) {
		cm = [NSEntityDescription insertNewObjectForEntityForName:@"Favoritos" inManagedObjectContext:self.managedObjectContext];
	}
    
    cm.url = url;
    
	[self.managedObjectContext save:nil];
	
}

+ (NSArray *)listarTodos {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Favoritos" inManagedObjectContext:self.managedObjectContext];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"url" ascending:YES]];
    
    NSError *error = nil;
    NSArray *arr = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (!error) {
        return arr ;
    } else {
        NSLog(@"%@",[error description]);
        return nil;
    }
}

@end

//
//  ExemploNavegacaoViewController.h
//  ExemploNavegacao
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExemploNavegacaoViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UITableView *tabela;
    NSArray *contatos;
}
@property (nonatomic, strong) IBOutlet UITableView *tabela;
@property (nonatomic, strong) NSArray *contatos;

@end

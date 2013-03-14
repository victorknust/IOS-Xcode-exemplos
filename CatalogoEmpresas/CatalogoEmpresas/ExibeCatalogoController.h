//
//  ExibeCatalogoControllerViewController.h
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-13.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExibeCatalogoController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *tabela;
@property (nonatomic, assign) NSArray *catalogo;

@end

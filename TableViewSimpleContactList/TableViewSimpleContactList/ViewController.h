//
//  ViewController.h
//  TableViewSimpleContactList
//
//  Created by Lucas Augusto da Silva on 2013-03-11.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *contatos;
}
@property (retain, nonatomic) IBOutlet UITableView *tabelaContatos;
- (IBAction)botaoEditarTap:(id)sender;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *botaoEditar;

@end

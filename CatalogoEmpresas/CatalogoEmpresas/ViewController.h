//
//  ViewController.h
//  CatalogoEmpresas
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *catalogo;
}

@property (retain, nonatomic) IBOutlet UITextField *nomeFiled;
@property (retain, nonatomic) IBOutlet UITextField *quantidadeField;
@property (retain, nonatomic) IBOutlet UILabel *avisoSucessoLabel;
@property (nonatomic, retain) IBOutlet UILabel *label;
- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;
-(void)menuButtonPressed;

@end

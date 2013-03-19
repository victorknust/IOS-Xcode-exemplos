//
//  ComentarioViewController.h
//  ExemploNavegacao
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComentarioViewController : UIViewController{
    UITextView *textView;
}
@property (nonatomic, strong) IBOutlet UITextView *textView;
- (void) salvar;

@end

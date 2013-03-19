//
//  AppDelegate.h
//  ExemploNavegacao
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExemploNavegacaoViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) IBOutlet UINavigationController *navegationController;
@property (nonatomic, strong) IBOutlet ExemploNavegacaoViewController *viewController;

@end

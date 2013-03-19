//
//  HWViewController.h
//  HelloWorld
//
//  Created by Lucas Augusto da Silva on 2013-03-08.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
- (IBAction)hideView:(id)sender;
- (IBAction)showView:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *workingView;

@end

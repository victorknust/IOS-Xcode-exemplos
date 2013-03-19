//
//  ViewController.h
//  NetworkingFlickr
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>{
    NSArray *elementos;
    NSMutableArray *imagens;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end

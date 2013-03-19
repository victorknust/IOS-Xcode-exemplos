//
//  FirstViewController.h
//  FavoritesViewer
//
//  Created by Fabio Marzullo on 25/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UIButton *addFavorite;
    UITextField *favoriteURL;
    UITableView *favoriteTable;
    UITabBar *tabbar;
    
    NSArray *listaDeFavoritos;
}

@property (nonatomic, retain) IBOutlet UIButton *addFavorite;
@property (nonatomic, retain) IBOutlet UITextField *favoriteURL;
@property (nonatomic, retain) IBOutlet UITableView *favoriteTable;
@property (nonatomic, retain) IBOutlet UITabBar *tabbar;
@property (nonatomic, retain) NSArray *listaDeFavoritos;

- (IBAction)addFavoritos:(id)sender;
- (void) dismissKeyboard;
- (void) setup;
@end

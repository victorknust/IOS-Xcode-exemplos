//
//  AppDelegate.h
//  FavoritesViewerDB
//
//  Created by Fabio Marzullo on 27/12/11.
//  Copyright (c) 2011 MZ Soluções em Gestão Empresarial Ltda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

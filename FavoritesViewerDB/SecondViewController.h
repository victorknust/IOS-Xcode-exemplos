//
//  SecondViewController.h
//  FavoritesViewer
//
//  Created by Fabio Marzullo on 25/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

- (void) updateURL:(NSString *)aUrl;
- (void) setup;
@end

//
//  SecondViewController.m
//  FavoritesViewer
//
//  Created by Fabio Marzullo on 25/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize webView;

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
     
}

-(void) setup
{
    self.title = @"Visão WEB";
}

- (void) awakeFromNib 
{
    [self setup];
    [super awakeFromNib];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) dealloc
{
    //[self.webView release];
    //[super dealloc];
}

- (void) updateURL:(NSString *)aUrl {
    if (![aUrl hasPrefix:@"http://"]) aUrl = [@"http://"stringByAppendingString:aUrl];
    NSURL*url=[NSURL URLWithString:aUrl];
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
   // NSLog(@"2 - %@",request.URL.path);
    [webView loadRequest:request];
}
@end

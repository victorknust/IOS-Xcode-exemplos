//
//  FirstViewController.m
//  FavoritesViewer
//
//  Created by Fabio Marzullo on 25/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "GerenciadorBD.h"

@implementation FirstViewController

@class SecondViewController;

@synthesize addFavorite, favoriteURL, favoriteTable, tabbar, listaDeFavoritos;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
    /*listaDeFavoritos = [[NSMutableArray alloc] initWithObjects:@"www.mzempresarial.com.br",
                                                               @"www.iphonenapratica.com.br",
                                                               @"www.soanapratica.com.br",nil];
    */
    listaDeFavoritos = [GerenciadorBD listarTodos];
}

- (void) dismissKeyboard {
    if (self.favoriteURL)
        [self.favoriteURL resignFirstResponder];
    //[self.view removeGestureRecognizer:tap];
}

-(void) setup
{
    self.title = @"Favoritos";
    favoriteTable.dataSource = self;
}

- (void) awakeFromNib {
    [self setup];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listaDeFavoritos count];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Favoritos * f = [listaDeFavoritos objectAtIndex:indexPath.row];
    [self dismissKeyboard];
    NSArray *arr = self.tabBarController.viewControllers;
    [[arr objectAtIndex:1] loadView];
    [[arr objectAtIndex:1] updateURL:f.url];
    [self.tabBarController setSelectedIndex:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellFavorites";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if (listaDeFavoritos.count > 0) {
        Favoritos * f = [listaDeFavoritos objectAtIndex:indexPath.row];
        cell.textLabel.text = f.url;
        
    }
        return cell;
}

- (IBAction)addFavoritos:(id)sender {
    [GerenciadorBD salvar:favoriteURL.text];
    listaDeFavoritos = [GerenciadorBD listarTodos];
    [favoriteTable reloadData];
    [self dismissKeyboard];
}


- (void) dealloc 
{
   /* [self.addFavorite release];
    [self.favoriteURL release];
    [self.favoriteTable release];
    [self.tabbar release];
    [self.listaDeFavoritos release];
    [super dealloc];*/
}
@end

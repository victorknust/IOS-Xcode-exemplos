//
//  ExemploNavegacaoViewController.m
//  ExemploNavegacao
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ExemploNavegacaoViewController.h"
#import "AddressBook/AddressBook.h"
#import "ComentarioViewController.h"

@implementation ExemploNavegacaoViewController
@synthesize tabela, contatos;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(nil, nil);
    
    ABRecordRef copiaAddressBook = ABAddressBookCopyDefaultSource(addressBook);
    
    contatos = (__bridge NSArray *) ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering
                                            (addressBook, copiaAddressBook, kABPersonSortByLastName);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"CatalogoCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]
            initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", (__bridge NSString *)ABRecordCopyValue((__bridge ABRecordRef)[contatos objectAtIndex:indexPath.row], kABPersonFirstNameProperty),  (__bridge NSString *)ABRecordCopyValue((__bridge ABRecordRef)[contatos objectAtIndex:indexPath.row], kABPersonLastNameProperty)];
    
    cell.detailTextLabel.text = (__bridge NSString *)ABRecordCopyValue((__bridge ABRecordRef)[contatos objectAtIndex:indexPath.row], kABPersonMiddleNameProperty);
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contatos count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0)
        return @"First Name";
    else
        return @"Last Name";
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ComentarioViewController *comentario = [[ComentarioViewController alloc] init];
    comentario.title = (__bridge NSString *)ABRecordCopyValue((__bridge ABRecordRef)([contatos objectAtIndex:indexPath.row]), kABPersonFirstNameProperty);
    
    [self.navigationController pushViewController:comentario animated:YES];
}

@end

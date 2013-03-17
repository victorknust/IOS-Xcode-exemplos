//
//  ViewController.m
//  ExemploDownload
//
//  Created by Lucas Augusto da Silva on 2013-03-16.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize downloadField, loadingIndicator, progressBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) downloadSavePathFor: (NSString *) filename {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    return [documentsPath stringByAppendingPathComponent:filename];
}

-(void) showMessage:(NSString *) message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso"
            message:message
            delegate:nil
            cancelButtonTitle:@"OK"
            otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)startDownload:(id)sender {
    [self.downloadField resignFirstResponder];
    
    NSURL *url = [NSURL URLWithString:downloadField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSString *saveFileName = [self downloadSavePathFor:url.lastPathComponent];
    
    NSLog(@"Salvando o arquivo em %@", saveFileName);
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:saveFileName append:NO];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *op, NSHTTPURLResponse *response) {
        [loadingIndicator stopAnimating];
        loadingIndicator.hidden = YES;
        
        [self showMessage:@"Download finalizado com sucesso"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self showMessage:[NSString stringWithFormat:@"Erro no download %@", [error localizedDescription]]];
    }];
    
    [operation setDownloadProgressBlock:^(NSUInteger read, long long totalRead, long long totalExpected) {
        progressBar.progress = totalRead / totalExpected;
    }];
    
    progressBar.hidden = NO;
    loadingIndicator.hidden = NO;
    [loadingIndicator startAnimating];
    
    [operation start];
}

@end

//
//  ViewController.m
//  NetworkingFlickr
//
//  Created by Lucas Augusto da Silva on 2013-03-17.
//  Copyright (c) 2013 Lucas Augusto da Silva. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url =
    [NSURL URLWithString:@"http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operacao = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id json) {
                                            elementos = [json objectForKey:@"items"];
                                            //[self mostraMensagem:[NSString stringWithFormat:@"%d imagens encontradas", elementos.count]];
                                            if (elementos.count > 0) {
                                                //[self inicializaScroll];
                                            }
                                        }
                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id json) {
                                            //[self mostraMensagem:[NSString stringWithFormat:@"Erro: %@",[error localizedDescription]]];
                                        }];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"application/x-javascript"]];
    [operacao start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

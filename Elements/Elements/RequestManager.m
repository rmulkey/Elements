//
//  RequestManager.m
//  Elements
//
//  Created by Mulkey, Rodrigo S. on 5/3/16.
//  Copyright © 2016 Mulkey, Rodrigo S. All rights reserved.
//


#import "RequestManager.h"
#import "Constants.h"
#import "CHCSVParser.h"


@implementation RequestManager

#pragma mark - initWithCallback:
- (id)initWithCallback:(ApiConnectorCallback)block {
    if (self = [super init])
        self.callbackBlock = block;
    
    return self;
}

- (void)fetchCSVFile {
    
    NSURL *requestURL = [NSURL URLWithString:DOCUMENT_DOWNLOAD_URL];
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    NSURLSessionDataTask *dataTask =
    [urlSession dataTaskWithRequest:request
                  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                      
                      if ((data) && (data.length > 0)) {
                          NSError *jsonError = nil;
                          NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                     options:NSJSONReadingMutableLeaves
                                                                                       error:&jsonError];
                          
                          if (!jsonObject) {
                              NSLog(@"Parsing JSON error: %@", jsonError);
                              self.callbackBlock(jsonError);
                          } else {
                              self.callbackBlock([jsonObject objectForKey:@""]);
                          }
                      }
                  }];
    
    [dataTask resume];
}

@end


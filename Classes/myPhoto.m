//
//  myPhoto.m
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import "myPhoto.h"
#import "ASIHTTPRequest.h"

@interface myPhoto ()
@property (nonatomic, retain) ASIHTTPRequest *request;
@end


@implementation myPhoto

- (id)initWithDictionary:(NSDictionary *)dict {
  if (self = [super init]) {
    if (![[dict valueForKey:@"name"] isKindOfClass:[NSNull class]]) {
      self.title = [dict valueForKey:@"name"];
    }
    
    if (![[dict valueForKey:@"details"] isKindOfClass:[NSNull class]]) {
      self.details = [dict valueForKey:@"details"];
    }
    
    self.image = [UIImage imageNamed:@"random.jpg"];
    if (![[dict valueForKey:@"image"] isKindOfClass:[NSNull class]]) {
      
      __block id blockSelf = self;
      self.request = [[ASIHTTPRequest requestWithURL:[NSURL URLWithString:[dict valueForKey:@"image"]]] retain];
      
      [request setCompletionBlock:^ {
        NSData *data = [request responseData];
        if ([data length] > 0) {
          [blockSelf setImage:[UIImage imageWithData:data]]; 
        }
        [blockSelf setRequest:nil];
      }];
      
      [request setFailedBlock:^ {
        [blockSelf setRequest:nil];
      }];
      
      [request startAsynchronous];
    }    
  }
  return self;
}


- (void)dealloc {
  if (request) {
    request.delegate = nil;
    [request cancel];
    self.request = nil;
  }
  self.title = nil;
  self.details = nil;
  self.image = nil;
  
  [super dealloc];
}
#pragma mark Synthesizer
@synthesize title, details, image, request;
@end

//
//  myPhoto.h
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASIHTTPRequest;

@interface myPhoto : NSObject {
  NSString *title;
  NSString *details;
  
  UIImage *image;
  
  @private
  ASIHTTPRequest *request;
}

- (id)initWithDictionary:(NSDictionary *)dict;

@property (nonatomic, retain) NSString *title, *details;
@property (nonatomic, retain) UIImage *image;
@end

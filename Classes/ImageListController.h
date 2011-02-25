//
//  RootViewController.h
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageListController : UITableViewController {
  NSArray *photos;
}

@property (nonatomic, retain) NSArray *photos;

@end

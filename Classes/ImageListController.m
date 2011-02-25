//
//  RootViewController.m
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import "ImageListController.h"
#import "JSON.h"
#import "ASIHTTPRequest.h"

#import "myPhoto.h"
#import "ImageListCell.h"

@implementation ImageListController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://dl.dropbox.com/u/3620340/WAQ/photos.json"]];
  request.delegate = self;
  request.didFinishSelector = @selector(photosLoaded:);
  [request startAsynchronous];
}


#pragma mark -
#pragma mark Table view
#pragma mark data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.photos count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  ImageListCell *cell = (ImageListCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[ImageListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
  }
  cell.photo = [self.photos objectAtIndex:indexPath.row];
  return cell;
}

#pragma mark delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



#pragma mark -
#pragma mark Memory management

- (void)dealloc {
  self.photos = nil;
  [super dealloc];
}

#pragma mark -
#pragma mark ASIHTTPRequest
- (void)photosLoaded:(ASIHTTPRequest *)request {
  NSArray *objects = [[request responseString] JSONValue];
  NSMutableArray *newPhotos = [NSMutableArray arrayWithCapacity:[objects count]];
  for (NSDictionary *obj in objects) {
    [newPhotos addObject:[[[myPhoto alloc] initWithDictionary:obj] autorelease]];
  }
  self.photos = newPhotos;
  [self.tableView reloadData];
}

#pragma mark Synthesizer
@synthesize photos;

@end


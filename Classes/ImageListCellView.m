//
//  ImageListCellView.m
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import "ImageListCellView.h"
#import "myPhoto.h"

@implementation ImageListCellView

- (void)drawRect:(CGRect)rect { 
  [self.photo.image drawAtPoint:CGPointMake(5, 5)];
  
  self.highlighted ? [[UIColor whiteColor] set] : [[UIColor blackColor] set];
  [self.photo.title drawAtPoint:CGPointMake(70, 5)
                       withFont:[UIFont boldSystemFontOfSize:16.0]];
  self.highlighted ? [[UIColor whiteColor] set] : [[UIColor grayColor] set];
  [self.photo.details drawAtPoint:CGPointMake(70, 30)
                       withFont:[UIFont systemFontOfSize:15.0]];

}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  [self setNeedsDisplay];
}

- (void)dealloc {
  self.photo = nil; //Will remove the current observer.
  [super dealloc];
}

#pragma mark Accessories
- (void)setPhoto:(myPhoto *)p {
  if (photo) {
    //Remove Current Observer
    [self.photo removeObserver:self forKeyPath:@"image"];
  }
  photo = p;
  [self.photo addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
  [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)h {
  highlighted = h;
  [self setNeedsDisplay];
}

#pragma mark Synthesizer
@synthesize photo, highlighted;
@end

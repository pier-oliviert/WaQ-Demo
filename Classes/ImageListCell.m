//
//  ImageListCellView.m
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import "ImageListCell.h"
#import "ImageListCellView.h"
#import "myPhoto.h"

@implementation ImageListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      imageListView = [[ImageListCellView alloc] initWithFrame:CGRectInset(self.frame, 0, 1)];
      imageListView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
      [self.contentView addSubview:imageListView];
    }
    return self;
}

- (void)setBackgroundColor:(UIColor *)c {
  super.backgroundColor = c;
  imageListView.backgroundColor = c;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
  [super setHighlighted:highlighted animated:animated];
  imageListView.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
  [imageListView release];
  [super dealloc];
}

- (void)setPhoto:(myPhoto *)photo {
  imageListView.photo = photo;
}

- (myPhoto *)photo {
  return imageListView.photo;
}


@end

//
//  ImageListCellView.h
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myPhoto, ImageListCellView;
@interface ImageListCell : UITableViewCell {
  ImageListCellView *imageListView;
}
//Proxy
- (void)setPhoto:(myPhoto *)photo;
- (myPhoto *)photo;
@end

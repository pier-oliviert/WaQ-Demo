//
//  ImageListCellView.h
//  waq-demo
//
//  Created by Pier-Olivier Thibault on 11-02-23.
//  Copyright 2011 25th Avenue. All rights reserved.
//

#import <UIKit/UIKit.h>

@class myPhoto;

@interface ImageListCellView : UIView {
  BOOL highlighted;
  myPhoto *photo;
}

@property (nonatomic, assign) myPhoto *photo;
@property (nonatomic, assign) BOOL highlighted;

@end

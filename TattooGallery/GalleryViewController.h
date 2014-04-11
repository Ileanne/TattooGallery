//
//  GalleryViewController.h
//  tattooAmesta
//
//  Created by LADEMO on 08/11/13.
//  Copyright (c) 2013 LADEMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray *typeArray;
@property (nonatomic, assign) BOOL comesFromArtist;

@end

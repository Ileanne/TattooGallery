//
//  DescriptionViewController.h
//  tattooAmesta
//
//  Created by Administrador on 11/11/13.
//  Copyright (c) 2013 LADEMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tattoo.h"

@interface DescriptionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *tattooImageView;
@property (weak, nonatomic) IBOutlet UILabel *tattooNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tattooArtistLabel;
@property (weak, nonatomic) IBOutlet UITextView *tattooDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *tattooTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *tattooLocationLabel;

@property (nonatomic, strong) NSDictionary *descriptionTattoo;

@end

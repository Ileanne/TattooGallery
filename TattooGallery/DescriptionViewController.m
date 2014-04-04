//
//  DescriptionViewController.m
//  tattooAmesta
//
//  Created by Administrador on 11/11/13.
//  Copyright (c) 2013 LADEMO. All rights reserved.
//

#import "DescriptionViewController.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface DescriptionViewController ()


@end

@implementation DescriptionViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UILabel * titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.text = [self.descriptionTattoo objectForKey:@"name"];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:20.0];
    titleView.shadowColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    titleView.shadowOffset = CGSizeMake(0.0f, 1.0f);
    titleView.textColor = UIColorFromRGB(0x5C0404);
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ricepaper.png"]];
    
    self.tattooNameLabel.text = [self.descriptionTattoo objectForKey:@"name"];
    self.tattooTypeLabel.text = [self.descriptionTattoo objectForKey:@"artist"];
    self.tattooArtistLabel.text = [self.descriptionTattoo objectForKey:@"type"];
    self.tattooDescriptionLabel.text = [self.descriptionTattoo objectForKey:@"description"];
    self.tattooLocationLabel.text = [self.descriptionTattoo objectForKey:@"location"];
    self.tattooImageView.image = [UIImage imageNamed:[self.descriptionTattoo objectForKey:@"image"]];
    
}






@end

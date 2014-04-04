//
//  GalleryViewController.m
//  tattooAmesta
//
//  Created by LADEMO on 08/11/13.
//  Copyright (c) 2013 LADEMO. All rights reserved.
//

#import "GalleryViewController.h"
#import "Tattoo.h"
#import "DescriptionViewController.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface GalleryViewController ()

@end

@implementation GalleryViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    NSDictionary* dictionary = [self.typeArray objectAtIndex:0];
    
    UILabel * titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.text = [dictionary objectForKey:@"type"];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:20.0];
    titleView.shadowColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    titleView.shadowOffset = CGSizeMake(0.0f, 1.0f);
    titleView.textColor = UIColorFromRGB(0x5C0404);
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ricepaper.png"]];

}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
    
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.typeArray.count;
    
}


-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *tattooInCell = [self.typeArray objectAtIndex:indexPath.row];
    
    //Tattoo *tattooInCell = [self.typeArray objectAtIndex:indexPath.row];
    
    UIImageView *tattooGallery = (UIImageView *)[cell viewWithTag:100];
    
    //NSLog(@"%@",tattooInCell.imageName);
    
    tattooGallery.image = [UIImage imageNamed:[tattooInCell objectForKey:@"image"]];
    
    return cell;

}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"showDescription" sender:nil];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showDescription"]) {
        
        DescriptionViewController *descriptionViewController = segue.destinationViewController;
        
        NSArray *indexArray = [self.collectionView indexPathsForSelectedItems];
        
        NSIndexPath *indexPath = [indexArray objectAtIndex:0];
        
        descriptionViewController.descriptionTattoo = [self.typeArray objectAtIndex:indexPath.row];
        
    }

}


@end

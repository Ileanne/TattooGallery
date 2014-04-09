//
//  TattooTypeViewController.m
//  tattooAmesta
//
//  Created by LADEMO on 08/11/13.
//  Copyright (c) 2013 LADEMO. All rights reserved.
//

#import "TattooTypeViewController.h"
#import "Tattoo.h"
#import "GalleryViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TattooTypeViewController ()

@end

@implementation TattooTypeViewController{

    NSArray *sectionTattooArrays;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ricepaper.png"]];
    
    UILabel * titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.text = @"Galería de Tatuajes";
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:20.0];
    titleView.shadowColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    titleView.shadowOffset = CGSizeMake(0.0f, 1.0f);
    titleView.textColor = UIColorFromRGB(0x5C0404);
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    
    NSMutableArray *auxArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TattooInfo" ofType:@"plist"]];
    
    NSMutableArray *skullsArray = [NSMutableArray array];
    NSMutableArray *flowersArray = [NSMutableArray array];
    NSMutableArray *animalsArray = [NSMutableArray array];
    NSMutableArray *geometricalArray = [NSMutableArray array];
    NSMutableArray *linesArray = [NSMutableArray array];
    NSMutableArray *fractalArray = [NSMutableArray array];
    
    
    for (NSDictionary *dictionary in auxArray) {
        
        NSString *type = [dictionary objectForKey:@"type"];
        
        if ([type isEqualToString:@"Skulls"]) {
            
            [skullsArray addObject:dictionary];
        }
        else if ([type isEqualToString:@"Flowers"]){
            
            [flowersArray addObject:dictionary];
        }
        else if ([type isEqualToString:@"Animals"]){
            
            [animalsArray addObject:dictionary];
        }
        else if ([type isEqualToString:@"Geometrical"]){
            
            [geometricalArray addObject:dictionary];
        }
        else if ([type isEqualToString:@"Lines"]){
            
            [linesArray addObject:dictionary];
        }
        else if ([type isEqualToString:@"Fractal"]){
            
            [fractalArray addObject:dictionary];
        }
    }

    //NSLog(@"%@",skullsArray);
    //NSLog(@"%@",flowersArray);
    //NSLog(@"%@",animalsArray);
    //NSLog(@"%@",geometricalArray);
    //NSLog(@"%@",linesArray);
    //NSLog(@"%@",fractalArray);
    
    
    /*for (int i=0; i<6; i++) {
        
        Tattoo *tattoo = [[Tattoo alloc] init];
        
        tattoo.imageName = [NSString stringWithFormat:@"tribal%d.jpg",i];
        
        tattoo.type = @"Tribal";
        
        tattoo.tattooName = [NSString stringWithFormat:@"Tribal %d",i+1];
        
        tattoo.artistName = [NSString stringWithFormat:@"Artista %d",i+1];
        
        tattoo.tattooDescription = [NSString stringWithFormat:@"Tatuaje tribal número %d",i+1];
        
        [tribalArray addObject:tattoo];
    }
    
    
    
    for (int i=0; i<14; i++) {
        
        Tattoo *tattoo = [[Tattoo alloc] init];
        
        tattoo.imageName = [NSString stringWithFormat:@"nature%d.jpg",i];
        
        tattoo.type = @"Nature";
        
        tattoo.tattooName = [NSString stringWithFormat:@"Nature %d", i+1];
        
        tattoo.artistName = [NSString stringWithFormat:@"Artista %d", i+1];
        
        tattoo.tattooDescription = [NSString stringWithFormat:@"Tatuaje nature número %d", i+1];
        
        [natureArray addObject:tattoo];
    }
    
    for (int i=0; i<6; i++) {
        
        Tattoo *tattoo = [[Tattoo alloc] init];
        
        tattoo.imageName = [NSString stringWithFormat:@"fractal%d.jpg",i];
        
        tattoo.type = @"Fractal";

        tattoo.tattooName = [NSString stringWithFormat:@"Fractal %d", i+1];
        
        tattoo.artistName = [NSString stringWithFormat:@"Artista %d", i+1];
        
        tattoo.tattooDescription = [NSString stringWithFormat:@"Tatuaje fractal número %d", i+1];
        
        [fractalArray addObject:tattoo];
    
    }*/
    
    //NSLog(@"%@",tribalArray);
    //NSLog(@"%@",natureArray);
    //NSLog(@"%@",fractalArray);
    
    sectionTattooArrays = [NSMutableArray arrayWithObjects:skullsArray, flowersArray, animalsArray, geometricalArray, linesArray, fractalArray, nil];
       
    //NSLog(@"%@",sectionTattooArrays);

}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return sectionTattooArrays.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{   //Revisar

    static NSString *cellIdentifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *tattooInCell = [sectionTattooArrays [indexPath.row] objectAtIndex:0];
    
    //Tattoo *tattooInCell = [sectionTattooArrays[indexPath.row] objectAtIndex:0];
    
    UIImageView *tattooImageView = (UIImageView *)[cell viewWithTag:100];
    
    tattooImageView.image = [UIImage imageNamed:[tattooInCell objectForKey:@"image"]];
    
    //tattooImageView.image = [UIImage imageNamed:tattooInCell.imageName];
    
    UILabel *tattooLabel = (UILabel *)[cell viewWithTag:101];
    
    tattooLabel.text = [tattooInCell objectForKey:@"type"];

    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"showType"]) {
        
        GalleryViewController *galleryViewController = segue.destinationViewController;
        
        NSArray *indexArray = [self.collectionView indexPathsForSelectedItems];
        
        NSIndexPath *indexPath = [indexArray objectAtIndex:0];
        
        galleryViewController.typeArray = [sectionTattooArrays objectAtIndex:indexPath.row];

        
    }
    
}




@end

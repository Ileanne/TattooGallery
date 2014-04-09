//
//  ArtistViewController.m
//  tattooAmesta
//
//  Created by Mónica González on 4/1/14.
//  Copyright (c) 2014 LADEMO. All rights reserved.
//

#import "ArtistViewController.h"
#import "Tattoo.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ArtistViewController ()

@end

@implementation ArtistViewController{

    NSArray *sectionArtistArrays;
}

#pragma mark Life Cycle

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //NSLog(@"View Did Load");
    
    self.tableView.backgroundView = nil;
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ricepaper.png"]];
    
    UILabel * titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.text = @"Artista";
    titleView.backgroundColor = [UIColor clearColor];
    titleView.font = [UIFont boldSystemFontOfSize:20.0];
    titleView.shadowColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    titleView.shadowOffset = CGSizeMake(0.0f, 1.0f);
    titleView.textColor = UIColorFromRGB(0x5C0404);
    self.navigationItem.titleView = titleView;
    [titleView sizeToFit];
    
    NSMutableArray *auxArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TattooInfo" ofType:@"plist"]];
    
    NSMutableArray *alice = [NSMutableArray array];
    NSMutableArray *chaim = [NSMutableArray array];
    NSMutableArray *david = [NSMutableArray array];
    NSMutableArray *ien = [NSMutableArray array];
    
    for (NSDictionary *dictionary in auxArray) {
        
        NSString *type = [dictionary objectForKey:@"artist"];
        
        if ([type isEqualToString:@"Alice Carrier"]) {
            
            [alice addObject:dictionary];
        }
        else if ([type isEqualToString:@"Chaim Machlev (DotsToLines)"]){
            
            [chaim addObject:dictionary];
        }
        else if ([type isEqualToString:@"David Hale"]){
            
            [david addObject:dictionary];
        }
        else if ([type isEqualToString:@"Ien Levin"]){
            
            [ien addObject:dictionary];
        }

    }
    
    NSLog(@"%@",alice);
    NSLog(@"%@",chaim);
    NSLog(@"%@",david);
    NSLog(@"%@",ien);
    
    sectionArtistArrays = [NSMutableArray arrayWithObjects:alice, chaim, ien, david,nil];


}
//
//-(void)viewWillAppear:(BOOL)animated{
//    
//    [super viewWillAppear:animated];
//    
//    NSLog(@"View Will Appear");
//}
//
//-(void)viewDidAppear:(BOOL)animated{
//    
//    NSLog(@"View Did Appear");
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    
//    NSLog(@"View will disappear");
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sectionArtistArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"artistCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //NSMutableArray *artistIndex = sectionArtistArrays[indexPath.row];
    NSMutableArray *artistAtIndex = [sectionArtistArrays objectAtIndex:indexPath.row];
    NSDictionary *artistDictionary = [artistAtIndex lastObject];
    
    cell.textLabel.text = [artistDictionary objectForKey:@"artist"];
    cell.detailTextLabel.text = [artistDictionary objectForKey:@"location"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

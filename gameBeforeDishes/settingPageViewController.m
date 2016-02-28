//
//  settingPageViewController.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "settingPageViewController.h"

@implementation settingPageViewController

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"adsfasdf");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return( 1 );
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return( 10 );
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cellToReturn = [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleDefault
                                                              reuseIdentifier: @"Cell" ];

    
    UILabel *numPlayersLabel = [[UILabel alloc] init];
    numPlayersLabel.text = @"2";

    
    switch (indexPath.row) {
        case 0:
            cellToReturn.textLabel.text = @"Number of players";
            cellToReturn.accessoryView = numPlayersLabel;
            
            break;
        case 1:
            cellToReturn.textLabel.text = @"Set player names";
            cellToReturn.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 2:
            cellToReturn.textLabel.text = @"Shuffle games";
            cellToReturn.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case 3:
            cellToReturn.textLabel.text = @"Set game list";
            cellToReturn.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            break;
    }
    //cellToReturn.textLabel.text = [ NSString stringWithFormat: @"%ld", indexPath.row];

    //cellToReturn.detailTextLabel.text = [ NSString stringWithFormat: @"%ld", indexPath.row];
    
    
    return( cellToReturn );
}



@end
//
//  settingPageViewController.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "settingPageViewController.h"

@implementation settingPageViewController
@synthesize tableOptions = _tableOptions;

- (NSArray *) tableOptions
{
    if (!_tableOptions)
        _tableOptions = @[@"Number of players",@"Set player names",@"Shuffle games",@"Set game list"];
    return _tableOptions;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return(1);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableOptions count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cellToReturn = [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleDefault
                                                              reuseIdentifier: @"Cell" ];

    
    
    //UILabel *numPlayersLabel = [[UILabel alloc] init];
    //numPlayersLabel.text = @"2";

    
    cellToReturn.textLabel.text = [ NSString stringWithFormat: @"%ld", indexPath.row];

    //cellToReturn.detailTextLabel.text = [ NSString stringWithFormat: @"%ld", indexPath.row];
    
    
    return( cellToReturn );
}



@end
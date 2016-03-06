//
//  GameListUITableViewController.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-06.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "GameListUITableViewController.h"

@interface GameListUITableViewController ()

@end

@implementation GameListUITableViewController

NSArray* listOfGames;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    listOfGames = [[NSUserDefaults standardUserDefaults] objectForKey:@"listOfSelectedMiniGames"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [listOfGames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"gameNameCells" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [listOfGames objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString* temp;
    
    if (cell.accessoryType == UITableViewCellAccessoryNone){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        temp = cell.textLabel.text;
        

        
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
   
}

@end

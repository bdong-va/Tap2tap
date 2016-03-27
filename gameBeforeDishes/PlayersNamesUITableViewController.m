//
//  PlayersNamesUITableViewController.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-02.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "PlayersNamesUITableViewController.h"
#import "textfieldTableViewCell.h"


@interface PlayersNamesUITableViewController ()

@end

@implementation PlayersNamesUITableViewController

NSMutableArray* players;


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    textfieldTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    cell.textField.text = cell.textLabel.text;
    cell.textField.hidden = NO;
    cell.textLabel.hidden = YES;

}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    textfieldTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    [players replaceObjectAtIndex:indexPath.row withObject:cell.textField.text];
    cell.textLabel.text = players[indexPath.row];
    
    // change object in userdefaults array with the corresponding object in players array
    //NSString *a = players[indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:players forKey:@"namesOfPlayers"];
 
    cell.textField.hidden = YES;
    cell.textLabel.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    players = [[[NSUserDefaults standardUserDefaults] objectForKey:@"namesOfPlayers"] mutableCopy];
    
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
    //return [playerNames count];
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"namesOfPlayers"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    textfieldTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"labelCell" forIndexPath:indexPath];
    cell.textField.hidden = YES;
    cell.textLabel.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"namesOfPlayers"] objectAtIndex:indexPath.row];
    //cell.textField.font = [UIFont fontWithName:@"menlo" size:17];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end

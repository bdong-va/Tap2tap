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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.textColor = [UIColor colorWithRed:0.992 green:0.992 blue:0.800 alpha:1.0];
    
    //
    NSArray* array = [[NSUserDefaults standardUserDefaults] objectForKey:@"listOfSelectedMiniGames"];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"listOfSelectedMiniGames"    ];
    
    NSString* currentGameName = array[indexPath.row];
    
    NSNumber *numObj = [[NSUserDefaults standardUserDefaults] objectForKey:currentGameName];
    if ([numObj boolValue]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
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
    
    
    NSArray* array = [[NSUserDefaults standardUserDefaults] objectForKey:@"listOfSelectedMiniGames"];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"listOfSelectedMiniGames"    ];
    
    NSString* currentGameName = array[indexPath.row];
    
    NSNumber *numObj = [[NSUserDefaults standardUserDefaults] objectForKey:currentGameName];
    if ([numObj boolValue]) {
        //[miniGameList setValue:[NSNumber numberWithBool:YES] forKey:@"game1"];    }
        [[ NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:NO] forKey:currentGameName];
    }else{
        [[ NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithBool:YES] forKey:currentGameName];
    }
   
}

@end

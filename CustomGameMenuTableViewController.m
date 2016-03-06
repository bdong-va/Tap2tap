//
//  CustomGameMenuTableViewController.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-02.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "CustomGameMenuTableViewController.h"


@interface CustomGameMenuTableViewController ()

@end

@implementation CustomGameMenuTableViewController



- (IBAction) stepperClicked:(id)sender{
    if (_stepper.value > 4){
        _stepper.value = 4;
    }else if (_stepper.value < 2 ){
        _stepper.value=2;
    }else{
        [[NSUserDefaults standardUserDefaults] setInteger:[_stepper value] forKey:@"numberOfPlayers"];
       
        NSInteger a = (NSInteger)[_stepper value];
        _numberOfPlayersLabel.text = [NSMutableString stringWithFormat:@"%@%ld", @"Number of Players: ", (long)a];
    }
}

- (IBAction)shuffleSwitch:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setBool:_shuffleOrderSwitch.on forKey:@"shuffleGameOrder"];
 

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GameInformationObject* game = [[GameInformationObject alloc] init];
    
    self.title = @"Custom Game Options";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 ){
        return 4;
    }else{
        return 1;
    }
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

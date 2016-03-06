//
//  CustomGameMenuTableViewController.h
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-02.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CustomGameMenuTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *numberOfPlayersLabel;
- (IBAction)stepperClicked:(id)sender;
- (IBAction)shuffleSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@property (weak, nonatomic) IBOutlet UISwitch *shuffleOrderSwitch;
@end


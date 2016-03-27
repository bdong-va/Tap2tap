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
    self.navigationController.navigationBarHidden = NO;
    self.title = @"Custom Game Options";
    
    // Make sure all labels display proper values based on user defaults
    _numberOfPlayersLabel.text = [NSMutableString stringWithFormat:@"%@%ld", @"Number of Players: ",[[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfPlayers"]] ;
    _stepper.value = [[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfPlayers"];
    
    _shuffleOrderSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"shuffleGameOrder"];
    
    _slider.value = [[NSUserDefaults standardUserDefaults] floatForKey:@"gameSpeed"];
    [self sliderSlid:_slider];
    
    
    _pointStepper.value = [[NSUserDefaults standardUserDefaults] integerForKey:@"maxPoints"];
    
    [self pointStepperClicked:_pointStepper];
    
    // styling status bar
//
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.001]];
    
    
    
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
        return 5;
    }else{
        return 1;
    }
}



- (IBAction)sliderSlid:(id)sender {
    if (_slider.value*100 < 10.0){
        _gameSpeedLabel.text = @"Game Speed: Molasses";
    }else if (_slider.value*100 < 40.0){
        _gameSpeedLabel.text = @"Game Speed: Slow";
    }else if(_slider.value*100 < 70.0){
        _gameSpeedLabel.text = @"Game Speed: Medium";
    }else if (_slider.value*100 <90.0){
        _gameSpeedLabel.text = @"Game Speed: Fast";
    }else{
        _gameSpeedLabel.text = @"Game Speed: Good luck";
    }
    
    [[NSUserDefaults standardUserDefaults] setFloat:_slider.value forKey:@"gameSpeed"];
}
- (IBAction)pointStepperClicked:(id)sender {
    _pointsLabel.text = [NSMutableString stringWithFormat:@"Points to Win Game: %ld", (NSInteger) _pointStepper.value];
    
    [[NSUserDefaults standardUserDefaults] setInteger:(NSInteger)_pointStepper.value forKey:@"maxPoints"];
}
- (IBAction)roundsPerMiniStepper:(id)sender {
    _roundsPerMingameLabel.text = [NSMutableString stringWithFormat:@"Rounds per Minigame: %ld", (NSInteger) _roundsStepper.value];
    
    [[NSUserDefaults standardUserDefaults] setInteger:(NSInteger)_roundsStepper.value forKey:@"roundsPerMiniGame"];
}
@end

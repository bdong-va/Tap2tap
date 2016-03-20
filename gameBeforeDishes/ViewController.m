//
//  ViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-01-22.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSInteger numberOfPlayers;

BOOL shuffleGameOrder;
NSArray* listOfSelectedMiniGames;
float gameSpeed;
NSInteger maxPoints;
NSDictionary* defaultUserDefaults;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"namesOfPlayers"] == NULL){
        
        numberOfPlayers = 2;
        _namesOfPlayers = [[NSMutableArray alloc] init];

        [_namesOfPlayers addObject:@"Player 1"];
        [_namesOfPlayers addObject:@"Player 2"];
        shuffleGameOrder = NO;
        listOfSelectedMiniGames = @[@"game1", @"game2", @"game3"];
        gameSpeed = 0.5;
        maxPoints = 50;
        
        [[NSUserDefaults standardUserDefaults] setObject:_namesOfPlayers forKey:@"namesOfPlayers"];
        [[NSUserDefaults standardUserDefaults] setInteger:numberOfPlayers forKey:@"numberOfPlayers"];
        [[NSUserDefaults standardUserDefaults] setObject:listOfSelectedMiniGames forKey:@"listOfSelectedMiniGames"];
        [[NSUserDefaults standardUserDefaults] setBool:shuffleGameOrder forKey:@"shuffleGameOrder"];
        [[NSUserDefaults standardUserDefaults] setFloat:gameSpeed forKey:@"gameSpeed"];
        [[NSUserDefaults standardUserDefaults] setInteger:maxPoints forKey:@"maxPoints"];
   }

    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

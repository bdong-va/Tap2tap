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
NSInteger roundsPerMiniGame;
NSDictionary* miniGameList;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
    //_secondTapButton.transform =
    [_secondTapButton setTransform:CGAffineTransformMakeRotation(-M_PI)];
  
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"namesOfPlayers"] == NULL){
        
        numberOfPlayers = 2;
        _namesOfPlayers = [[NSMutableArray alloc] init];
        
        miniGameList = [[NSDictionary alloc] initWithObjectsAndKeys:
                        [NSNumber numberWithBool:YES], @"game1",
                        [NSNumber numberWithBool:YES], @"game2",
                        [NSNumber numberWithBool:YES], @"game3",
                        nil];
        
        
//        NSNumber *x =[NSNumber numberWithBool:YES];
//        [miniGameList setValue:x forKey:@"game1"];
//        [miniGameList setValue:[NSNumber numberWithBool:YES] forKey:@"game1"];
//        [miniGameList setValue:[NSNumber numberWithBool:YES] forKey:@"game1"];

        [_namesOfPlayers addObject:@"Player 1"];
        [_namesOfPlayers addObject:@"Player 2"];
        shuffleGameOrder = NO;
        listOfSelectedMiniGames = @[@"game1", @"game2", @"game3"];
        gameSpeed = 0.5;
        maxPoints = 50;
        roundsPerMiniGame = 3;
        
        [[NSUserDefaults standardUserDefaults] setObject:_namesOfPlayers forKey:@"namesOfPlayers"];
        [[NSUserDefaults standardUserDefaults] setInteger:numberOfPlayers forKey:@"numberOfPlayers"];
        [[NSUserDefaults standardUserDefaults] setObject:listOfSelectedMiniGames forKey:@"listOfSelectedMiniGames"];
        [[NSUserDefaults standardUserDefaults] setBool:shuffleGameOrder forKey:@"shuffleGameOrder"];
        [[NSUserDefaults standardUserDefaults] setFloat:gameSpeed forKey:@"gameSpeed"];
        [[NSUserDefaults standardUserDefaults] setInteger:maxPoints forKey:@"maxPoints"];
        [[NSUserDefaults standardUserDefaults] setInteger:roundsPerMiniGame forKey:@"roundsPerMiniGame"];
   }

    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

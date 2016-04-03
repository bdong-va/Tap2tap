//
//  ViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-01-22.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "ViewController.h"
#import "gameConst.h"

@interface ViewController ()

@end

@implementation ViewController
{
    gameConst* games;
}
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
    games = [[gameConst alloc] init];
    self.navigationController.navigationBarHidden = YES;
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"namesOfPlayers"] == NULL){

        numberOfPlayers = 2;
        _namesOfPlayers = [[NSMutableArray alloc] init];
        
        miniGameList = [[NSDictionary alloc] initWithObjects:[[NSArray alloc] initWithObjects:
                                                          [NSNumber numberWithBool:YES],
                                                          [NSNumber numberWithBool:YES],
                                                          [NSNumber numberWithBool:YES],
                                                          [NSNumber numberWithBool:YES],
                                                          [NSNumber numberWithBool:YES],
                                                          [NSNumber numberWithBool:YES],
                                                          nil] forKeys:[games.gameNameAndID allKeys]];
    
    
    
        
//        NSNumber *x =[NSNumber numberWithBool:YES];
//        [miniGameList setValue:x forKey:@"game1"];
//        [miniGameList setValue:[NSNumber numberWithBool:YES] forKey:@"game1"];
//        [miniGameList setValue:[NSNumber numberWithBool:YES] forKey:@"game1"];

        [_namesOfPlayers addObject:@"Player 1"];
        [_namesOfPlayers addObject:@"Player 2"];
        shuffleGameOrder = NO;
        listOfSelectedMiniGames = [miniGameList allKeys];
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

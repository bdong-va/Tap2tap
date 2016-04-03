//
//  gameViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "gameViewController.h"
#import "gameConst.h"

UIColor* winColor;
UIColor* lostColor;
UIColor* normalColor;

gameConst* constString;
NSMutableArray* gameList;
NSMutableArray* unplayedGameList;
int currentGamePlayed;
int gameRoundsPerMiniGame;
int currentHighScore;
int totalScoreLimit;
bool buttonLock;
bool randomGame;
bool gameEnd;

@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    gameEnd = false;
    currentGamePlayed = 0;
    gameRoundsPerMiniGame = [[NSUserDefaults standardUserDefaults] integerForKey:@"roundsPerMiniGame"];
    totalScoreLimit = [[NSUserDefaults standardUserDefaults] integerForKey:@"maxPoints"];
    randomGame = [[NSUserDefaults standardUserDefaults] boolForKey:@"shuffleGameOrder"];
    buttonLock = false;
    _winImage.hidden = true;
    constString = [[gameConst alloc] init];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.toolbarHidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
    self.buttonList = [NSMutableArray arrayWithObjects:_button1,_button2,_button3,_button4, nil];
    self.scoreLabelList = [NSMutableArray arrayWithObjects:_ScoreLabel1,_ScoreLabel2,_ScoreLabel3,_ScoreLabel4, nil];
    self.scoreList = [NSMutableArray arrayWithCapacity:4];
    self.scoreList[0]=@0;
    self.scoreList[1]=@0;
    self.scoreList[2]=@0;
    self.scoreList[3]=@0;
    //setting up games.
    gameList = [NSMutableArray arrayWithArray:[constString.gameNameAndID allValues]];
    //remove games deselected.
    for (id key in constString.gameNameAndID)
    {
        bool gameSelected = [[NSUserDefaults standardUserDefaults] boolForKey:key];
        if (!gameSelected)
        {
            [gameList removeObject:[constString.gameNameAndID objectForKey:key]];
        }
    }
    // empty check
    if (gameList.count == 0)
    {
        gameList = [NSMutableArray arrayWithArray:[constString.gameNameAndID allValues]];
    }
    //shuffle game if necessary
    if (randomGame)
    {
        for (NSUInteger i = gameList.count; i > 1; i--) [gameList exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    }
    
    unplayedGameList = [[NSMutableArray alloc] initWithArray:gameList];
    
    [self updateScoreLabels];
    
    winColor = [UIColor colorWithRed:0.38 green:1 blue:0.412 alpha:1];
    lostColor= [UIColor colorWithRed:1 green:0.412 blue:0.38 alpha:1];
    normalColor = [UIColor colorWithRed:0.992 green:0.992 blue:0.800 alpha:1.0];
    _button1.transform = CGAffineTransformMakeRotation(M_PI);
    _ScoreLabel1.transform = CGAffineTransformMakeRotation(M_PI);
    _button3.hidden = true;
    _button4.hidden = true;
    [self showViewB];
    self.currentVC = self.childViewControllers.lastObject;
    
    [self SwitchControllers];
    [self resetButtonStatus];
    currentGamePlayed = 0;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"quiz_embed"]) {
        _currentVC = (EmbedGameViewController *) [segue destinationViewController];
    }
}

-(IBAction)pressPlayerButton:(id)sender
{
    if (buttonLock == false) {
        buttonLock = true;
        [self setButtonsStatus:sender isItWin:[_currentVC isGoodTime]];
        [NSTimer scheduledTimerWithTimeInterval:2.0
                                         target:self
                                       selector:@selector(resetButtonStatus)
                                       userInfo:nil
                                        repeats:NO];
        [_currentVC pauseGame];
        [_currentVC showAnswer];
    }

}


-(void)SwitchControllers{
    if ([unplayedGameList count] == 0) {
        unplayedGameList = [[NSMutableArray alloc] initWithArray:gameList];
    }
    NSString* thisGame = unplayedGameList[0];
    EmbedGameViewController* thisGameVC = [self.storyboard instantiateViewControllerWithIdentifier:unplayedGameList[0]];
    
    [self addChildViewController:thisGameVC];
    thisGameVC.view.frame = self.containerViewB.bounds;
    [self moveToNewController:thisGameVC];
    [unplayedGameList removeObject: thisGame];
}

-(void)moveToNewController:(EmbedGameViewController *) newController {
    [self.currentVC willMoveToParentViewController:nil];
    [self transitionFromViewController:self.currentVC toViewController:newController duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{}
                            completion:^(BOOL finished) {
                                [self.currentVC removeFromParentViewController];
                                [newController didMoveToParentViewController:self];
                                self.currentVC = newController;
                                for (UIButton *button  in _buttonList) {
                                    [button setTitle:[_currentVC getGameInstruction] forState:UIControlStateNormal];
                                    [button setBackgroundColor:normalColor];
                                }
                            }];
}


- (void)setButtonsStatus:(UIButton*)pressedButton isItWin:(BOOL)isGoodTimeToPress
{
    int arrayIndex = [_buttonList indexOfObject:pressedButton];
    if (isGoodTimeToPress) {
        [pressedButton setBackgroundColor:winColor];
        [pressedButton setTitle:[constString.PositiveWinText objectAtIndex:arc4random() % [constString.PositiveWinText count]] forState:UIControlStateNormal];
        int value = [_scoreList[arrayIndex] integerValue];
        [self.scoreList replaceObjectAtIndex:arrayIndex withObject:[NSNumber numberWithInt:value+1]];
        UILabel* thisLabel = self.scoreLabelList[arrayIndex];
        thisLabel.text = [NSString stringWithFormat: @"%@", _scoreList[arrayIndex]];
        for (UIButton *button  in _buttonList) {
            if (button != pressedButton) {
                [button setTitle:[constString.NegativeLostText objectAtIndex:arc4random() % [constString.NegativeLostText count]] forState:UIControlStateNormal];
                [button setBackgroundColor:lostColor];
            }
        }
    }else {
        [pressedButton setBackgroundColor:lostColor];
        [pressedButton setTitle:[constString.PositiveLostText objectAtIndex:arc4random() % [constString.PositiveLostText count]] forState:UIControlStateNormal];
        int value = [_scoreList[arrayIndex] integerValue];
        [self.scoreList replaceObjectAtIndex:arrayIndex withObject:[NSNumber numberWithInt:value-1]];
        [self updateScoreLabels];
        for (UIButton *button  in _buttonList) {
            if (button != pressedButton) {
                [button setTitle:[constString.NegativeWinText objectAtIndex:arc4random() % [constString.NegativeWinText count]] forState:UIControlStateNormal];
                [button setBackgroundColor:winColor];

            }
        }
    }
}

-(void)resetButtonStatus
{
    if (!gameEnd)
    {
        buttonLock = false;
        [_currentVC resetGame];
        [self UpdateGameStatus];
        [self checkAnyoneWin];
        for (UIButton *button  in _buttonList) {
            [button setTitle:[_currentVC getGameInstruction] forState:UIControlStateNormal];
            [button setBackgroundColor:normalColor];
        }
    }
}

-(void)updateScoreLabels
{
    int index = 0;
    for (UILabel *label in _scoreLabelList)
    {
        label.text = [NSString stringWithFormat: @"%@", _scoreList[index]];
        index ++;
    }
}

-(void)showViewA
{
//    self.containerViewA.alpha = 1;
    self.containerViewA.hidden = false;
//    self.containerViewB.alpha = 0;
    self.containerViewB.hidden = true;

}

-(void)showViewB
{
//    self.containerViewA.alpha = 0;
    self.containerViewA.hidden = true;
    self.containerViewB.hidden = false;

//    self.containerViewB.alpha = 1;
}

- (IBAction)popBackMenu:(id)sender
{
    if (self.navigationController.navigationBar.hidden) {
        [[self navigationController] setNavigationBarHidden:NO animated:YES];
        self.navigationController.navigationBar.hidden = NO;
    }else{
        [[self navigationController] setNavigationBarHidden:YES animated:YES];
        self.navigationController.navigationBar.hidden = YES;
    }
}


- (void)UpdateGameStatus
{
    currentGamePlayed++;
    if (currentGamePlayed >= gameRoundsPerMiniGame) {
        currentGamePlayed = 0;
        [self SwitchControllers];
    }

}

-(void)checkAnyoneWin
{

    if ([_scoreList[0] integerValue] >= totalScoreLimit || [_scoreList[1] integerValue] >= totalScoreLimit)
    {
        NSLog(@"it passed!");
        //pause everything
        gameEnd= true;
        buttonLock = true;
        [self.currentVC pauseGame];
        for (UIButton *button  in _buttonList) {
            [button setTitle:[_currentVC getGameInstruction] forState:UIControlStateNormal];
            [button setBackgroundColor:normalColor];
        }
        //show winning page.
        [self showViewA];
        _winImage.hidden = false;
        if ([_scoreList[0] integerValue]>(int)[_scoreList[1] integerValue]) // player 1 win
        {
            _winImage.transform =CGAffineTransformMakeRotation(M_PI);
            [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(player1Win)
                                           userInfo:nil
                                            repeats:NO];
        }
        else
        {
            [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(player2Win)
                                           userInfo:nil
                                            repeats:NO];
        }

    }
}

-(void)player1Win
{
    [_button2 setTitle:@"Next Time!" forState:UIControlStateNormal];
    [_button1 setTitle:@"You Win!" forState:UIControlStateNormal];
}

-(void)player2Win
{
    [_button1 setTitle:@"Next Time!" forState:UIControlStateNormal];
    [_button2 setTitle:@"You Win!" forState:UIControlStateNormal];
}
@end

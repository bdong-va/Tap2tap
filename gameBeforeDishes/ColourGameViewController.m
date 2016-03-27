//
//  ColourGameViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-03-27.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "ColourGameViewController.h"
#import "gameConst.h"


@interface ColourGameViewController ()

@end

@implementation ColourGameViewController
{
    gameConst* puzzles;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    float gameSpeedValue;
    gameSpeedValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"gameSpeed"];
    gameSpeedValue = -4*gameSpeedValue;
    super.timerValue = 5 + gameSpeedValue;
    super.gameInstruction = @"Is Color Match Word?";
    
    
    super.QuestionUp.textAlignment = NSTextAlignmentCenter;
    super.QuestionDown.textAlignment = NSTextAlignmentCenter;
    super.AnswerUp.textAlignment = NSTextAlignmentCenter;
    super.AnswerDown.textAlignment = NSTextAlignmentCenter;
    
    
    [super.threadProgressView1 setTransform:CGAffineTransformMakeRotation(-M_PI)];
    
    super.GoodTimeToPressButton = true;
    [super.QuestionUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    [super.AnswerUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    puzzles = [[gameConst alloc] init];
    [self generatePuzzle];
    super.Timer = [NSTimer scheduledTimerWithTimeInterval:super.timerValue
                                                   target:self
                                                 selector:@selector(generatePuzzle)
                                                 userInfo:nil
                                                  repeats:NO];
}

- (void)generatePuzzle
{
    [self animateProgressView2];
    [self createNewPuzzlewith:[puzzles randomBoolWithYesPercentage:30]];
    [super.Timer invalidate];
    super.Timer = [NSTimer scheduledTimerWithTimeInterval:super.timerValue
                                                   target:self
                                                 selector:@selector(generatePuzzle)
                                                 userInfo:nil
                                                  repeats:NO];
}

- (void)createNewPuzzlewith:(bool)isCorrect
{
    if (isCorrect) {
        super.GoodTimeToPressButton = true;
        NSString* colorName = [puzzles getRandomKeyfromDict:puzzles.ColorList];
        [self setAnswer:colorName];
        UIColor* correctColor = [puzzles getColorFromDict:puzzles.ColorList :colorName];
        self.AnswerUp.textColor = correctColor;
        self.AnswerDown.textColor = correctColor;
    }
    else
    {
        super.GoodTimeToPressButton = false;
        NSMutableDictionary* newDict = [NSMutableDictionary dictionaryWithDictionary:puzzles.ColorList];
        NSString* colorName = [puzzles getRandomKeyfromDict:puzzles.ColorList];
        [self setAnswer:colorName];
        [newDict removeObjectForKey:colorName];
        UIColor* incorrectColor = [puzzles getRandomColorFromDict:newDict];
        self.AnswerUp.textColor = incorrectColor;
        self.AnswerDown.textColor = incorrectColor;
    }
}

- (BOOL)isGoodTime
{
    return super.GoodTimeToPressButton;
}

-(void)updateProgressBar
{
    if(super.Time >= super.timerValue)
    {
        //Invalidate timer when time reaches 0
        [super.countdownTimer invalidate];
    }
    else
    {
        super.Time += 0.05;
        super.threadProgressView1.progress = (super.timerValue - super.Time)/super.timerValue;
        super.threadProgressView2.progress = (super.timerValue - super.Time)/super.timerValue;
    }
}

-(void)animateProgressView2
{
    [super.countdownTimer invalidate];
    super.threadProgressView1.progress = 1.0;
    super.threadProgressView2.progress = 1.0;
    super.Time = 0.1;
    super.countdownTimer = [NSTimer scheduledTimerWithTimeInterval: 0.05f
                                                            target: self
                                                          selector: @selector(updateProgressBar)
                                                          userInfo: nil
                                                           repeats: YES];
}

- (void)resetGame
{
    [super.Timer invalidate];
    [self generatePuzzle];
}

- (void)pauseGame
{
    [super.countdownTimer invalidate];
    [super.Timer invalidate];
    super.Time = super.timerValue;
}
@end

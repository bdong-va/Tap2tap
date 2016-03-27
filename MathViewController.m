//
//  MathViewController.m
//  gameBeforeDishes
//
//  Created by Graeme Judkins on 2016-03-27.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "MathViewController.h"
#import "gameConst.h"

@interface MathViewController ()

@end

@implementation MathViewController
{
    gameConst* puzzles;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    float gameSpeedValue;
    gameSpeedValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"gameSpeed"];
    gameSpeedValue = -4*gameSpeedValue;
    super.timerValue = 5 + gameSpeedValue;
    super.gameInstruction = @"Is This Equation Correct?";
    
    
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
}

- (void)generatePuzzle
{
    [self animateProgressView2];
    [self createNewPuzzlewith:[self randomBoolWithYesPercentage:30]];
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
        int firstNum = (arc4random_uniform(40));
        int secondNum = (arc4random_uniform(40));
        int sum;
        NSString* sign;
        if(arc4random_uniform(100) < 50)
        {
            sum = firstNum + secondNum;
            sign = @" + ";
        }
        else
        {
            sum = firstNum - secondNum;
            sign = @" - ";
        }
        NSString* question = [NSString stringWithFormat:@"%d%@%d = ", firstNum, sign, secondNum];
        [self setQuestion:question];
        NSString* answer = [NSString stringWithFormat:@"%d", sum];
        [self setAnswer:answer];
    }
    else
    {
        super.GoodTimeToPressButton = false;
        int firstNum = (arc4random_uniform(40));
        int secondNum = (arc4random_uniform(40));
        int sum;
        NSString* sign;
        if(arc4random_uniform(100) < 50)
        {
            int randomOffset = arc4random_uniform(20)-10;
            if (randomOffset == 0)
            {
                randomOffset ++;
            }
            sum = firstNum + secondNum + randomOffset;
            sign = @" + ";
        }
        else
        {
            int randomOffset = arc4random_uniform(20)-10;
            if (randomOffset == 0)
            {
                randomOffset ++;
            }
            sum = firstNum - secondNum + randomOffset;
            sign = @" - ";
        }
        NSString* question = [NSString stringWithFormat:@"%d%@%d = ", firstNum, sign, secondNum];
        [self setQuestion:question];
        NSString* answer = [NSString stringWithFormat:@"%d", sum];
        [self setAnswer:answer];
        
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

-(BOOL)randomBoolWithYesPercentage:(int) percentage
{
    return arc4random_uniform(100) < percentage;
}
@end

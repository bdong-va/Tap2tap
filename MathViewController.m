//
//  MathViewController.m
//  gameBeforeDishes
//
//  Created by Graeme Judkins on 2016-03-27.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "MathViewController.h"

@interface MathViewController ()

@end

@implementation MathViewController

float mathTimerValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float gameSpeedValue;
    gameSpeedValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"gameSpeed"];
    gameSpeedValue = -4*gameSpeedValue;
    mathTimerValue = 5 + gameSpeedValue;
    
    
    
    super.QuestionUp.textAlignment = NSTextAlignmentCenter;
    super.QuestionDown.textAlignment = NSTextAlignmentCenter;
    super.AnswerUp.textAlignment = NSTextAlignmentCenter;
    super.AnswerDown.textAlignment = NSTextAlignmentCenter;
    
    
    [super.threadProgressView1 setTransform:CGAffineTransformMakeRotation(-M_PI)];
    
    super.GoodTimeToPressButton = true;
    [super.QuestionUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    [super.AnswerUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    [self generateMathQuestion];
    [NSTimer scheduledTimerWithTimeInterval:mathTimerValue
                                     target:self
                                   selector:@selector(generateMathQuestion)
                                   userInfo:nil
                                    repeats:YES];
    
    
    
    
    
}

- (void)generateMathQuestion
{
    [self animateProgressView2];
    bool isCorrect = arc4random_uniform(100) < 50;
    [self createNewMathQuestion:isCorrect];
    
}

- (void)createNewMathQuestion:(bool)isCorrect
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
    if(super.Time >= mathTimerValue)
    {
        //Invalidate timer when time reaches 0
        [super.Timer invalidate];
    }
    else
    {
        super.Time += 0.05;
        super.threadProgressView1.progress = (mathTimerValue - super.Time)/mathTimerValue;
        super.threadProgressView2.progress = (mathTimerValue - super.Time)/mathTimerValue;
    }
}

-(void)animateProgressView2
{
    [super.Timer invalidate];
    super.threadProgressView1.progress = 1.0;
    super.threadProgressView2.progress = 1.0;
    super.Time = 0.1;
    super.Timer = [NSTimer scheduledTimerWithTimeInterval: 0.05f
                                                   target: self
                                                 selector: @selector(updateProgressBar)
                                                 userInfo: nil
                                                  repeats: YES];
}
@end

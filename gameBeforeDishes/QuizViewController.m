//
//  QuizViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-03-06.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "QuizViewController.h"
#import "gameConst.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
{
    gameConst* puzzles;
}

float timerValue;

- (void)viewDidLoad {
    [super viewDidLoad];

    float gameSpeedValue;
    gameSpeedValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"gameSpeed"];
    gameSpeedValue = -4*gameSpeedValue;
    timerValue = 5 + gameSpeedValue;
    
    
    
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
    [NSTimer scheduledTimerWithTimeInterval:timerValue
                                     target:self
                                   selector:@selector(generatePuzzle)
                                   userInfo:nil
                                    repeats:YES];
    
    

    

}

- (void)generatePuzzle
{
    [self animateProgressView2];
    [self createNewPuzzlewith:[puzzles randomBoolWithYesPercentage:30]];
    
}

- (void)createNewPuzzlewith:(bool)isCorrect
{
    if (isCorrect) {
        super.GoodTimeToPressButton = true;
        NSString* capital = [puzzles getRandomKeyfromDict:puzzles.capitalAndState];
        [self setAnswer:capital];
        NSString* state = puzzles.capitalAndState[capital];
        [self setQuestion:state];
    }
    else
    {
        super.GoodTimeToPressButton = false;
        NSMutableDictionary* newDict = [NSMutableDictionary dictionaryWithDictionary:puzzles.capitalAndState];
        NSString* capital = [puzzles getRandomKeyfromDict:newDict];
        [self setAnswer:capital];
        [newDict removeObjectForKey:capital];
        NSString* state = [puzzles getRandomValuefromMutableDict:newDict];
        [self setQuestion:state];
        
    }
}

- (BOOL)isGoodTime
{
    return super.GoodTimeToPressButton;
}

-(void)updateProgressBar
{
    if(super.Time >= timerValue)
    {
        //Invalidate timer when time reaches 0
        [super.Timer invalidate];
    }
    else
    {
        super.Time += 0.05;
        super.threadProgressView1.progress = (timerValue - super.Time)/timerValue;
        super.threadProgressView2.progress = (timerValue - super.Time)/timerValue;
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

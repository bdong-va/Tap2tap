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
- (void)viewDidLoad {
    [super viewDidLoad];
    _QuestionUp.textAlignment = NSTextAlignmentCenter;
    _QuestionDown.textAlignment = NSTextAlignmentCenter;
    _AnswerUp.textAlignment = NSTextAlignmentCenter;
    _AnswerDown.textAlignment = NSTextAlignmentCenter;
    
    [_threadProgressView1 setTransform:CGAffineTransformMakeRotation(-M_PI)];

    _GoodTimeToPressButton = true;
    [_QuestionUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    [_AnswerUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    puzzles = [[gameConst alloc] init];
    [self generatePuzzle];
    [NSTimer scheduledTimerWithTimeInterval:1.5
                                     target:self
                                   selector:@selector(generatePuzzle)
                                   userInfo:nil
                                    repeats:YES];
    
}

- (void)setQuestion:(NSString*)theQuestion
{
    _QuestionUp.text = theQuestion;
    _QuestionDown.text = theQuestion;
}

- (void)setAnswer:(NSString*)theAnswer
{
    _AnswerUp.text = theAnswer;
    _AnswerDown.text = theAnswer;
}

- (void)generatePuzzle
{
    [self animateProgressView2];
    [self createNewPuzzlewith:[puzzles randomBoolWithYesPercentage:30]];
    
}

- (void)createNewPuzzlewith:(bool)isCorrect
{
    if (isCorrect) {
        _GoodTimeToPressButton = true;
        NSString* capital = [puzzles getRandomKeyfromDict:puzzles.capitalAndState];
        [self setAnswer:capital];
        NSString* state = puzzles.capitalAndState[capital];
        [self setQuestion:state];
    }
    else
    {
        _GoodTimeToPressButton = false;
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
    return _GoodTimeToPressButton;
}

-(void)updateProgressBar
{
    if(_Time >= 1.5f)
    {
        //Invalidate timer when time reaches 0
        [_Timer invalidate];
    }
    else
    {
        _Time += 0.05;
        _threadProgressView1.progress = (1.5 - _Time)/1.5;
        _threadProgressView2.progress = (1.5 - _Time)/1.5;
    }
}

-(void)animateProgressView2
{
    [_Timer invalidate];
    _threadProgressView1.progress = 1.0;
    _threadProgressView2.progress = 1.0;
    _Time = 0.1;
    _Timer = [NSTimer scheduledTimerWithTimeInterval: 0.05f
                                             target: self
                                           selector: @selector(updateProgressBar)
                                           userInfo: nil
                                            repeats: YES];
}
@end

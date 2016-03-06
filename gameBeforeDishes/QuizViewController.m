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

    _GoodTimeToPressButton = true;
    [_QuestionUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    [_AnswerUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    puzzles = [[gameConst alloc] init];
    [self generatePuzzle];
    [NSTimer scheduledTimerWithTimeInterval:5.0
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
@end

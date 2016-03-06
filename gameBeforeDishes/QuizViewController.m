//
//  QuizViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-03-06.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _GoodTimeToPressButton = false;
    [_QuestionUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    [_AnswerUp setTransform:CGAffineTransformMakeRotation(-M_PI)];
    
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



@end

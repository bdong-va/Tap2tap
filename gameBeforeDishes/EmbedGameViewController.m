//
//  EmbedGameViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-03-13.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "EmbedGameViewController.h"

@interface EmbedGameViewController ()

@end

@implementation EmbedGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (BOOL)isGoodTime
{
    return _GoodTimeToPressButton;
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

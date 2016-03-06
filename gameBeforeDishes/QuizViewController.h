//
//  QuizViewController.h
//  gameBeforeDishes
//
//  Created by bdong on 2016-03-06.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
@property BOOL GoodTimeToPressButton;
@property IBOutlet UILabel* QuestionUp;
@property IBOutlet UILabel* QuestionDown;
@property IBOutlet UILabel* AnswerUp;
@property IBOutlet UILabel* AnswerDown;

- (void)setQuestion:(NSString*)theQuestion;
- (void)setAnswer:(NSString*)theAnswer;



@end

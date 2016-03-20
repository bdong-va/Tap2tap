//
//  gameViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "gameViewController.h"
#import "gameConst.h"
#import "QuizViewController.h"
#import "GreenScreenViewController.h"

UIColor* winColor;
UIColor* lostColor;
UIColor* normalColor;
gameConst* constString;
EmbedGameViewController* quizController;
@implementation gameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
    self.buttonList = [NSMutableArray arrayWithObjects:_button1,_button2,_button3,_button4, nil];
    winColor = [UIColor colorWithRed:0.38 green:1 blue:0.412 alpha:1];
    lostColor= [UIColor colorWithRed:1 green:0.412 blue:0.38 alpha:1];
    normalColor = [UIColor colorWithRed:0.6 green:0.95 blue:1 alpha:1];
    constString = [[gameConst alloc] init];
    _button1.transform = CGAffineTransformMakeRotation(M_PI);
//    _button1.backgroundColor = [constString getColorFromDict:constString.ColorList :@"BLACK"];
    _button3.hidden = true;
    _button4.hidden = true;
    [self showViewB];
    self.initialVC = self.childViewControllers.lastObject;
    self.substituteVC = [self.storyboard instantiateViewControllerWithIdentifier:@"wewe"];
    self.currentVC = self.initialVC;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"quiz_embed"]) {
        quizController = (EmbedGameViewController *) [segue destinationViewController];
    }
}

-(IBAction)pressPlayerButton:(id)sender
{
    [self setButtonsStatus:sender isItWin:[quizController isGoodTime]];
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(resetButtonStatus)
                                   userInfo:nil
                                    repeats:NO];
    [self SwitchControllers:sender];
}


-(void)SwitchControllers:(UISegmentedControl *)sender {
    [self addChildViewController:self.substituteVC];
    self.substituteVC.view.frame = self.containerViewB.bounds;
    [self moveToNewController:self.substituteVC];
}

-(void)moveToNewController:(UIViewController *) newController {
    [self.currentVC willMoveToParentViewController:nil];
    [self transitionFromViewController:self.currentVC toViewController:newController duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{}
                            completion:^(BOOL finished) {
                                [self.currentVC removeFromParentViewController];
                                [newController didMoveToParentViewController:self];
                                self.currentVC = newController;
                            }];
}


- (void)setButtonsStatus:(UIButton*)pressedButton isItWin:(BOOL)isGoodTimeToPress
{
    if (isGoodTimeToPress) {
        [pressedButton setBackgroundColor:winColor];
        [pressedButton setTitle:[constString.PositiveWinText objectAtIndex:arc4random() % [constString.PositiveWinText count]] forState:UIControlStateNormal];
        for (UIButton *button  in _buttonList) {
            if (button != pressedButton) {
                [button setTitle:[constString.NegativeLostText objectAtIndex:arc4random() % [constString.NegativeLostText count]] forState:UIControlStateNormal];
                [button setBackgroundColor:lostColor];
            }
        }
    }else {
        [pressedButton setBackgroundColor:lostColor];
        [pressedButton setTitle:[constString.PositiveLostText objectAtIndex:arc4random() % [constString.PositiveLostText count]] forState:UIControlStateNormal];
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
    for (UIButton *button  in _buttonList) {
            //TODO set back to button's name
            [button setTitle:@" " forState:UIControlStateNormal];
            [button setBackgroundColor:normalColor];
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

@end

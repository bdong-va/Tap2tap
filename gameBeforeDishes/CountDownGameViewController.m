//
//  CountDownGameViewController.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-20.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "CountDownGameViewController.h"

@interface CountDownGameViewController ()

@end

float a;
NSTimer* fastTimer;
int iterations;
float x;

@implementation CountDownGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startGame];
    super.gameInstruction = @"Be the first to click when counter gets to 0!";
    //[super.threadProgressView1 setTransform:CGAffineTransformMakeRotation(-M_PI)];
    UILabel* lab = [super QuestionDown];
    [lab setTransform:CGAffineTransformMakeRotation(-M_PI)];
    

    
}

-(void) startGame{
    super.GoodTimeToPressButton = NO;
    [fastTimer invalidate];
    a = 1.00;
    _countdownNumber = 4;
    _countdownNumber = _countdownNumber + arc4random_uniform(5);
    x = _countdownNumber;
    iterations = 0;
    super.QuestionUp.alpha = 1;
    super.QuestionDown.alpha = 1;
    super.QuestionUp.text = [NSMutableString stringWithFormat:@"%d", _countdownNumber];
    super.QuestionDown.text = [NSMutableString stringWithFormat:@"%d", _countdownNumber];
    
    
    super.Timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(tick)
                                           userInfo:nil
                                            repeats:YES];
}

//-(void) callTimer{
//    fastTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
//                                                 target:self
//                                               selector:@selector(alp)
//                                               userInfo:nil
//                                                repeats:YES];
//}

- (void) tick{
    if (_countdownNumber <=0){
        [super.Timer invalidate];
        [fastTimer invalidate];
        super.GoodTimeToPressButton = YES;
    }
  
    super.QuestionUp.text = [NSMutableString stringWithFormat:@"%d", _countdownNumber];
    super.QuestionDown.text = [NSMutableString stringWithFormat:@"%d", _countdownNumber];
    _countdownNumber--;
    
    a = a - ((1/x) +0.1);
    super.QuestionUp.alpha = (a);
    super.QuestionDown.alpha = (a);
    NSLog([NSMutableString stringWithFormat:@"%f", a]);
    
    

}

-(void) alp{
    a = a-0.018;
    super.QuestionUp.alpha = (a);
    super.QuestionDown.alpha = (a);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetGame{
    [super.Timer invalidate];
    [self startGame];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

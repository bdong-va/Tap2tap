//
//  GreenScreenViewController.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-03-18.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "GreenScreenViewController.h"

@implementation GreenScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    super.gameInstruction = @"Click button when it turns GREEN!";
    [self startGame];
}

- (void)startGame
{
    int randomSec = [self getRandomNumberBetween:3 to:8];
    super.GoodTimeToPressButton = false;
    super.Timer = [NSTimer scheduledTimerWithTimeInterval:randomSec
                                     target:self
                                   selector:@selector(turnGreen)
                                   userInfo:nil
                                    repeats:NO];
}

//copy from http://stackoverflow.com/questions/6385053/random-number-generating-in-objective-c
-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

- (void)turnGreen
{
    super.GoodTimeToPressButton = true;
    self.view.backgroundColor = [UIColor greenColor];
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(turnWhite)
                                   userInfo:nil
                                    repeats:NO];
    
}

-(void)turnWhite
{
    super.GoodTimeToPressButton = false;
    self.view.backgroundColor = [UIColor whiteColor];
    [self startGame];
}

- (void)resetGame
{
    [self.Timer invalidate];
    [self startGame];

}
@end

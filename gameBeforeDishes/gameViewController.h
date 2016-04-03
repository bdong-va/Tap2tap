//
//  gameViewController.h
//  gameBeforeDishes
//
//  Created by bdong on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmbedGameViewController.h"


@interface gameViewController : UIViewController
// four buttons operated by player

@property IBOutlet UIButton* button1;
@property IBOutlet UIButton* button2;
@property IBOutlet UIButton* button3;
@property IBOutlet UIButton* button4;

@property IBOutlet UILabel* ScoreLabel1;
@property IBOutlet UILabel* ScoreLabel2;
@property IBOutlet UILabel* ScoreLabel3;
@property IBOutlet UILabel* ScoreLabel4;

@property NSMutableArray* PositiveWinText;
@property NSMutableArray* PositiveLostText;
@property NSMutableArray* NegativeWinText;
@property NSMutableArray* NegativeLostText;

@property NSMutableArray* buttonList;
@property NSMutableArray* scoreLabelList;
@property NSMutableArray* scoreList;
@property IBOutlet UIImageView* winImage;

@property IBOutlet UIButton* backButton;

@property IBOutlet UIView *containerViewA;
@property IBOutlet UIView *containerViewB;

@property (strong,nonatomic) EmbedGameViewController *initialVC;
@property (strong,nonatomic) EmbedGameViewController *substituteVC;
@property (strong,nonatomic) EmbedGameViewController *currentVC;

@end

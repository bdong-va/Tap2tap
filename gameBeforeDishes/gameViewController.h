//
//  gameViewController.h
//  gameBeforeDishes
//
//  Created by bdong on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface gameViewController : UIViewController
// four buttons operated by player
@property IBOutlet UIButton* button1;
@property IBOutlet UIButton* button2;
@property IBOutlet UIButton* button3;
@property IBOutlet UIButton* button4;

@property NSMutableArray* PositiveWinText;
@property NSMutableArray* PositiveLostText;
@property NSMutableArray* NegativeWinText;
@property NSMutableArray* NegativeLostText;

@property NSMutableArray* buttonList;

@end

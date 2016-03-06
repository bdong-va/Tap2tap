//
//  GameInformationObject.h
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-02.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameInformationObject : NSObject

//- (GameInformationObject*) basicinit;

@property NSInteger numberOfPlayers;
@property NSArray* namesOfPlayers;
@property BOOL shuffleGameOrder;
@property NSArray* listOfSelectedMiniGames;

@end

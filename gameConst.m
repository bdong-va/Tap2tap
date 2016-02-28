//
//  gameConst.m
//  gameBeforeDishes
//
//  Created by bdong on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "gameConst.h"

@implementation gameConst


- (id) init {
    self = [super init];
    
    if (self) {
        self.PositiveLostText = [NSMutableArray arrayWithObjects:@"Bad One!",@"Wrong!", nil];
        self.PositiveWinText = [NSMutableArray arrayWithObjects:@"Awesome!",@"Got it!", nil];
        self.NegativeWinText = [NSMutableArray arrayWithObjects:@"Ha!",@"wow!", nil];
        self.NegativeLostText = [NSMutableArray arrayWithObjects:@"too Slow!",@"Next Time!", nil];
    }
    
    return self;
}

- (NSString*)getRandomStringfrom:(NSMutableArray*) theArray {
    NSUInteger randomIndex = arc4random() % [theArray count];
    NSString* returnString = [theArray objectAtIndex:randomIndex];
    return returnString;
}

@end

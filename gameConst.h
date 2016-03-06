//
//  gameConst.h
//  gameBeforeDishes
//
//  Created by bdong on 2016-02-28.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface gameConst : NSObject

@property NSMutableArray* PositiveWinText;
@property NSMutableArray* PositiveLostText;
@property NSMutableArray* NegativeWinText;
@property NSMutableArray* NegativeLostText;
@property NSDictionary* ColorList;

- (NSString*)getRandomObjectFromArray:(NSMutableArray*) theArray;
- (NSString*)getRandomKeyfromDict:(NSDictionary*) theDict;
- (NSString*)getRandomValuefromDict:(NSDictionary*) theDict;
- (NSString *)convertColorToString :(UIColor *)colorname;
-(UIColor *)getColorFromDict :(NSDictionary *)dicname :(NSString *)keyname;

@end

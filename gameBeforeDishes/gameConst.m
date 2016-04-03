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
        self.PositiveLostText = [NSMutableArray arrayWithObjects:@"Nope!",@"Wrong!", nil];
        self.PositiveWinText = [NSMutableArray arrayWithObjects:@"Awesome!",@"Got it!", nil];
        self.NegativeWinText = [NSMutableArray arrayWithObjects:@"Ha!",@"Correct!", nil];
        self.NegativeLostText = [NSMutableArray arrayWithObjects:@"Too Slow!",@"Next Time!", nil];
        self.ColorList = @{
                           @"BLUE": [self convertColorToString: [UIColor blueColor]],
                           @"RED": [self convertColorToString: [UIColor redColor]],
                           @"BLACK": [self convertColorToString: [UIColor blackColor]],
                           /*@"YELLOW": [self convertColorToString: [UIColor yellowColor]],*/
                           //removed these colours as they conflict with the background
                           @"PURPLE": [self convertColorToString: [UIColor purpleColor]],
                           @"ORANGE": [self convertColorToString: [UIColor orangeColor]],
                           @"GRAY": [self convertColorToString: [UIColor grayColor]],
                           /*@"WHITE": [self convertColorToString: [UIColor whiteColor]],*/
                           @"BROWN": [self convertColorToString: [UIColor brownColor]],
                           @"CYAN": [self convertColorToString: [UIColor cyanColor]],
                           @"GREEN": [self convertColorToString: [UIColor greenColor]],
                           
                           };
        self.capitalAndState = @{
                                 @"Beijing":@"China",
                                 @"Ottawa":@"Canada",
                                 @"London":@"UK",
                                 @"Brasilia":@"Brazil",
                                 @"Canberra":@"Australia",
                                 @"Kathmandu":@"Nepal",
                                 @"Kabul":@"Afghanistan",
                                 @"Oslo":@"Norway",
                                 @"Lisbon":@"Portugal",
                                 @"Manilla":@"Phillipines",
                                 @"Copenhagen":@"Denmark",
                                 @"Cairo":@"Egypt",
                                 @"Helsinki":@"Finland",
                                 @"Paris":@"France",
                                 @"Moscow":@"Russia",
                                 @"Riyadh":@"Saudi Arabia",
                                 @"Stockholm":@"Sweden",
                                 @"Athens":@"Greece",
                                 @"Rome":@"Italy",
                                 @"New Delhi":@"India",
                                 @"Ankara":@"Turkey",
                                 @"Bangkok":@"Thailand",
                                 @"Reykjavik":@"Iceland",
                                 @"Dublin":@"Ireland",
                                 @"Tokyo":@"Japan",
                                 @"Beirut":@"Lebanon",
                                 @"Washington D.C.":@"USA",
                                 };
        self.correctAlphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        self.wrongAlphabet =  @{
                           @"ABCDEFGHIJKLNMOPQRSTUVWXYZ":@"ABCDEFGHIJKL>nm<OPQRSTUVWXYZ",
                           @"ABCDEFGHIJKLMNOPRQSTUVWXYZ":@"ABCDEFGHIJKLMNOP>rq<STUVWXYZ",
                           @"ABCDEFGHJIKLMNOPQRSTUVWXYZ":@"ABCDEFGH>ji<KLMNOPQRSTUVWXYZ",
                           @"ABCDEFGHIJKLMNOPQRSTVUWXYZ":@"ABCDEFGHIJKLMNOPQRST>vu<WXYZ",
                           @"ABCDFEGHIJKLMNOPQRSTUVWXYZ":@"ABCD>fe<GHIJKLMNOPQRSTUVWXYZ",
                           @"ABCDEFGHIJKLMNPOQRSTUVWXYZ":@"ABCDEFGHIJKLMN>po<QRSTUVWXYZ",
                           @"ABDCEFGHIJKLMNOPQRSTUVWXYZ":@"AB>dc<EFGHIJKLMNOPQRSTUVWXYZ",
                           @"ABCDEFGHIJKLMNOPQRSTUVWYXZ":@"ABCDEFGHIJKLMNOPQRSTUVW>yx<Z",
                           @"ABCDEFGHIJKLMNOPQRSTUWVXYZ":@"ABCDEFGHIJKLMNOPQRSTU>wv<XYZ",
                           };
    }
    
    return self;
}

- (NSString*)getRandomObjectFromArray:(NSMutableArray*) theArray {
    NSUInteger randomIndex = arc4random() % [theArray count];
    NSString* returnObject = [theArray objectAtIndex:randomIndex];
    return returnObject;
}

- (NSString*)getRandomKeyfromDict:(NSDictionary*) theDict {
    NSArray *theKeys = [theDict allKeys];
    return [self getRandomObjectFromArray:[NSMutableArray arrayWithArray:theKeys]];
}

- (NSString*)getRandomValuefromDict:(NSDictionary*) theDict {
    NSArray *theValues = [theDict allValues];
    return [self getRandomObjectFromArray:[NSMutableArray arrayWithArray:theValues]];
}
- (NSString*)getRandomValuefromMutableDict:(NSMutableDictionary*) theDict {
    NSArray *theValues = [theDict allValues];
    return [self getRandomObjectFromArray:[NSMutableArray arrayWithArray:theValues]];
}

//borrowed from http://stackoverflow.com/questions/12677907/storing-uicolors-in-nsdictionary-and-retrieving-them

- (NSString *)convertColorToString :(UIColor *)colorname
{
    if(colorname==[UIColor whiteColor] )
    {
        colorname= [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    }
    else if(colorname==[UIColor blackColor])
    {
        colorname= [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    else
    {
        colorname=colorname;
    }
    CGColorRef colorRef = colorname.CGColor;
    NSString *colorString;
    colorString=[CIColor colorWithCGColor:colorRef].stringRepresentation;
    return colorString;
}

//borrowed from http://stackoverflow.com/questions/12677907/storing-uicolors-in-nsdictionary-and-retrieving-them
- (UIColor *)getColorFromDict :(NSDictionary *)dicname :(NSString *)keyname
{
    CIColor *coreColor = [CIColor colorWithString:[dicname valueForKey:keyname]];
    UIColor *color = [UIColor colorWithRed:coreColor.red green:coreColor.green blue:coreColor.blue alpha:coreColor.alpha];
    //NSLog(@"color name :%@",color);
    return color;
}

- (UIColor *)getRandomColorFromDict :(NSDictionary *)dicname
{
    NSString* keyname = [self getRandomKeyfromDict:dicname];
    CIColor *coreColor = [CIColor colorWithString:[dicname valueForKey:keyname]];
    UIColor *color = [UIColor colorWithRed:coreColor.red green:coreColor.green blue:coreColor.blue alpha:coreColor.alpha];
    //NSLog(@"color name :%@",color);
    return color;
}


-(BOOL)randomBoolWithYesPercentage:(int) percentage
{
    return arc4random_uniform(100) < percentage;
}

@end

//
//  textfieldTableViewCell.m
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-15.
//  Copyright © 2016 bdong. All rights reserved.
//

#import "textfieldTableViewCell.h"

@implementation textfieldTableViewCell
@synthesize textField = _textField;



- (void)awakeFromNib {
    // Initialization code
   
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)cellTouched:(id)sender {
    _textField.text = [self.textLabel text];
    _textField.hidden = NO;
    self.textLabel.hidden = YES;
    NSLog(@"sdfgdsfg");
    
}
@end

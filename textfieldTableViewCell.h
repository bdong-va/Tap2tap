//
//  textfieldTableViewCell.h
//  gameBeforeDishes
//
//  Created by Kent Walters on 2016-03-15.
//  Copyright © 2016 bdong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textfieldTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)cellTouched:(id)sender;

@end

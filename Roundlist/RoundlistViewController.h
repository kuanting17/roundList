//
//  RoundlistViewController.h
//  Roundlist
//
//  Created by Kuanting Chen on 9/29/13.
//  Copyright (c) 2013 KC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "RoundlistAppDelegate.h"

@interface RoundlistViewController : UIViewController
{
    IBOutlet UITextField *name;
    IBOutlet UITextField *email;
    IBOutlet UITextField *phone;    
}
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (retain, nonatomic) RoundlistAppDelegate *app;


- (IBAction)Save:(id)sender;





@end

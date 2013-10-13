//
//  RoundlistViewController.m
//  Roundlist
//
//  Created by Kuanting Chen on 9/29/13.
//  Copyright (c) 2013 KC. All rights reserved.
//

#import "RoundlistViewController.h"

@interface RoundlistViewController ()

@end

@implementation RoundlistViewController
@synthesize name = _name, email = _email, phone = _phone, app;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)Save:(id)sender
{
    app = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [app managedObjectContext];
    Item *item = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:context];
    
    if (name.text.length <= 0 || phone.text.length <= 0 || email.text.length <= 0) {
        NSLog(@"Nope");
    }
    else {
        item.name = name.text;
        item.phone = [NSNumber numberWithInteger:[phone.text integerValue]];
        [self.navigationController popViewControllerAnimated:YES];
    }
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Woops");
    }
}
@end

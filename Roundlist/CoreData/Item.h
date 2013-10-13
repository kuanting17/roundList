//
//  Item.h
//  Roundlist
//
//  Created by Kuanting Chen on 10/9/13.
//  Copyright (c) 2013 KC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ItemType;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * phone;
@property (nonatomic, retain) ItemType *itemType;

@end

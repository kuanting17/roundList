//
//  ItemType.h
//  Roundlist
//
//  Created by Kuanting Chen on 9/29/13.
//  Copyright (c) 2013 KC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ItemType : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *item;
@end

@interface ItemType (CoreDataGeneratedAccessors)

- (void)addItemObject:(NSManagedObject *)value;
- (void)removeItemObject:(NSManagedObject *)value;
- (void)addItem:(NSSet *)values;
- (void)removeItem:(NSSet *)values;

@end

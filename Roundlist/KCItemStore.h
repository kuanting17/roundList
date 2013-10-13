//
//  KCItemStore.h
//  Roundlist
//
//  Created by Kuanting Chen on 10/10/13.
//  Copyright (c) 2013 KC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Item;

@interface KCItemStore : NSObject
{
    NSMutableArray *allItems;
    NSMutableArray *allItemTypes;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

- (KCItemStore *)defaultStore;

- (void)removeItem:(Item *)p;

- (NSArray *)allItems;

-(void)moveItemAtindex:(int)from
               toIndex:(int)to;

- (NSString *)itemArchivePath;

- (BOOL)saveChange;

-(NSArray *)allItemTypes;

- (void)loadItems;

@end

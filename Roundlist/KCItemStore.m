//
//  KCItemStore.m
//  Roundlist
//
//  Created by Kuanting Chen on 10/10/13.
//  Copyright (c) 2013 KC. All rights reserved.
//

#import "KCItemStore.h"
#import "Item.h"

@implementation KCItemStore

+ (KCItemStore *)defaultStore
{
    static KCItemStore *defaultStore =nil;
    if (!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    return defaultStore;
}

+ (id)allocWithZone: (NSZone *)zone
{
    return [self defaultStore];
}

- (id) init
{
    self = [super init];
    if (self)
    {
        //read in RoundList.xcdatamodle
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        //connect with context and model
        NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        //where is the SQlite file going?
        NSString *path = [self itemArchivePath];
        NSURL *storeURL = [NSURL fileURLWithPath:path];
        
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
        {
            [NSException raise:@"Open failed" format:@"Reason: %@", [error localizedDescription]];
        }
        //create the managed object context
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:psc];
        
        [self loadItems];
    }
    return self;
}

- (void)loadItems
{
    if (!allItems)
    {
        //use NSFetchRequest to fetch data
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Item"];
        [request setEntity:e];
        //sort data
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObjects:sd, nil]];
        //if fetch error
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result) {
            [NSException raise:@"Fetch failed"
                        format:@"Reason: %@", [error localizedDescription]];
        }
        allItems = [[NSMutableArray alloc] initWithArray:result];
    }
}

- (NSString *)itemArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    //get one and only one document from the list
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"store.data"];
}

- (BOOL)saveChanges
{
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if (!successful){
    }
    return successful;
}





















@end

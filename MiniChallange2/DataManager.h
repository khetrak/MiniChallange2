//
//  DataManager.h
//  ShoppingMapCreator
//
//  Created by Rafael Gonçalves on 4/22/14.
//  Copyright (c) 2014 Rafael Goncalves. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^SaveCallback)(NSError *error);

@interface DataManager : NSObject

#pragma mark - PROPERTIES
@property (nonatomic,strong) NSDate *lastSavedDate;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (copy) SaveCallback saveCallback;

#pragma mark - PUBLIC METHODS
-(void)saveWithCallback:(SaveCallback)callback;
+(DataManager *)sharedManager;

@end

//
//  Score.m
//  testejogocriança1
//
//  Created by Rafael Gonçalves on 4/23/14.
//  Copyright (c) 2014 MiniChal2. All rights reserved.
//

#import "Score.h"


@implementation Score

@dynamic score;
@dynamic name;

#pragma mark - BUILDER
+(Score *)buildScoreWithName:(NSString *)name andScore:(double)scoreNumber {
    NSManagedObjectContext *ctx = [[DataManager sharedManager] managedObjectContext];
    Score *score = [[Score alloc] initWithEntity:[NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:ctx] insertIntoManagedObjectContext:ctx];
    score.score = @(scoreNumber);
    score.name = name;
    NSError *error;
    [ctx save:&error];
    if (error) {
        NSLog(@"%@",error.localizedDescription);
        return nil;
    }
    return score;
}

#pragma mark - RETREIVERS
+(NSArray *)retreiveScoresWithLimit:(int)limit {
    NSManagedObjectContext *ctx = [[DataManager sharedManager] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:ctx]];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:[[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO], nil]];
    [fetchRequest setFetchLimit:limit];
    NSError *error = nil;
    NSArray *fetchedObjects = [ctx executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"%@",error.localizedDescription);
        return nil;
    }
    return fetchedObjects;
}

@end

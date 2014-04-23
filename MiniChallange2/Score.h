//
//  Score.h
//  testejogocriança1
//
//  Created by Rafael Gonçalves on 4/23/14.
//  Copyright (c) 2014 MiniChal2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Score : NSManagedObject

@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * name;


+(Score *)buildScoreWithName:(NSString *)name andScore:(double)scoreNumber;
+(NSArray *)retreiveScoresWithLimit:(int)limit;

@end

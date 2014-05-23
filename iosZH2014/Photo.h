//
//  Photo.h
//  iosZH2014
//
//  Created by PPKE-IMAC-4 on 2014.05.23..
//  Copyright (c) 2014 Quintz Gábor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Albums;

@interface Photo : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) Albums *newRelationship;

@end

//
//  QGPin.h
//  iosZH2014
//
//  Created by PPKE-IMAC-4 on 2014.05.23..
//  Copyright (c) 2014 Quintz Gábor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface QGPin : NSObject

@property (strong, nonatomic) NSString *title;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title;
@end

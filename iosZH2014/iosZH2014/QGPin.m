//
//  QGPin.m
//  iosZH2014
//
//  Created by PPKE-IMAC-4 on 2014.05.23..
//  Copyright (c) 2014 Quintz Gábor. All rights reserved.
//

#import "QGPin.h"

@implementation QGPin

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
    }
    return self;
}

@end
//
//  MPGAnnotation.m
//  Mapper
//
//  Created by Greg Paton on 2/19/13.
//  Copyright (c) 2013 Greg Paton. All rights reserved.
//

#import "MPGAnnotation.h"

@implementation MPGAnnotation

@synthesize coordinate= _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        _coordinate = coordinate;
    }
    return self;
}

@end

//
//  MPGAnnotation.h
//  Mapper
//
//  Created by Greg Paton on 2/19/13.
//  Copyright (c) 2013 Greg Paton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MPGAnnotation : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate;
    
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end

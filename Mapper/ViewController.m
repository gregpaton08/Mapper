//
//  ViewController.m
//  Mapper
//
//  Created by Greg Paton on 2/19/13.
//  Copyright (c) 2013 Greg Paton. All rights reserved.
//

#import "ViewController.h"
#include "MPGAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface ViewController ()

@end

@implementation ViewController

@synthesize mapView = _mapView;
@synthesize btRefresh = _btRefresh;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    // initialize location manager
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}

- (IBAction)btRefreshClick:(id)sender {
    // zoom around current location with half mile radius
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(loc.coordinate,
                                                                       0.5 * METERS_PER_MILE,
                                                                       0.5 * METERS_PER_MILE);    
    [_mapView setRegion:viewRegion animated:YES];
    
    MPGAnnotation *annotation = [[MPGAnnotation alloc] initWithCoordinate:loc.coordinate];
    [_mapView addAnnotation:annotation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    // update current location
    loc = [locations lastObject];
    NSLog(@"Loc: %f %f\n", loc.coordinate.latitude, loc.coordinate.longitude);
}

@end

//
//  ViewController.m
//  DemoBearing
//
//  Created by Marco on 05/09/13.
//  Copyright (c) 2013 Marco Mirisola. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>{
    NSNumber *bearingDegrees;
    CLLocationManager *locationManager;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Initialize our CLLocationManager
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    [locationManager startUpdatingHeading];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    CLLocation *aLocation = [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(44.42532,8.847627)
                                                          altitude:0
                                                horizontalAccuracy:0
                                                  verticalAccuracy:0
                                                         timestamp:[NSDate date]];
    
    bearingDegrees = [Bearing bearingBetweenStartLocation:newLocation andEndLocation:aLocation];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    NSLog(@"Device is pointing %@",[Bearing getCardinalDirectionFromHeading:newHeading.magneticHeading]);
    _imgCompass.transform = CGAffineTransformMakeRotation(([bearingDegrees intValue] - newHeading.magneticHeading) * M_PI / 180);
}

@end

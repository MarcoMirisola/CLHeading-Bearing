//
//  CLHeading+Bearing.m
//  DemoBearing
//
//  Created by Marco on 05/09/13.
//  Copyright (c) 2013 Marco Mirisola. All rights reserved.
//


#import "CLHeading+Bearing.h"

double DegreesToRadians(double degrees) {return degrees * M_PI / 180.0;};
double RadiansToDegrees(double radians) {return radians * 180.0/M_PI;};

@implementation Bearing

+(NSNumber *) bearingBetweenStartLocation:(CLLocation *)startLocation andEndLocation:(CLLocation *)endLocation{
    
    float startLocationLat = startLocation.coordinate.latitude;
    float startLocationLon = startLocation.coordinate.longitude;
    
    float endLocationLat = endLocation.coordinate.latitude;
    float endLocationLon = endLocation.coordinate.longitude;
    
    float lat1 = DegreesToRadians(startLocationLat);
    float lng1 = DegreesToRadians(startLocationLon);
    float lat2 = DegreesToRadians(endLocationLat);
    float lng2 = DegreesToRadians(endLocationLon);
    float deltalng = lng2 - lng1;
    double y = sin(deltalng) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltalng);
    double bearing = atan2(y, x) + 2 * M_PI;
    float bearingDegrees = RadiansToDegrees(bearing);
    bearingDegrees = (int)bearingDegrees % 360;
    
    //NSLog(@"%d", (int)bearingDegrees);
    return [NSNumber numberWithInt:bearingDegrees];
}

+(NSString *)getCardinalDirectionFromHeading:(float)heading{
    
    if ((heading > 338) || (heading <= 22))
        return @"N";
    else if ((heading > 22) && (heading <= 68))
        return @"NE";
    else if ((heading > 68) && (heading <= 113))
        return @"E";
    else if ((heading > 113) && (heading <= 158))
        return @"SE";
    else if ((heading > 158) && (heading <= 203))
        return @"S";
    else if ((heading > 203) && (heading <= 248))
        return @"SW";
    else if ((heading > 248) && (heading <= 293))
        return @"W";
    else if ((heading > 293) && (heading <= 338))
        return @"NW";
    else{
        NSLog (@"%f",heading);
        return @"Unknown";
    }
}
@end

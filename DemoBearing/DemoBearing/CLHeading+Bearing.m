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
    
    NSLog(@"%f ; %f", startLocationLat, startLocationLon);
    
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
    
    NSLog(@"%d", (int)bearingDegrees);
    return [NSNumber numberWithInt:bearingDegrees];
}

+(NSString *)getCardinalDirectionFromHeading:(float)mHeading{
//    float mHeading = heading.magneticHeading; //It's only to make the code easier to read
    
    if ((mHeading > 338) || (mHeading <= 22))
        return @"N";
    else if ((mHeading > 22) && (mHeading <= 68))
        return @"NE";
    else if ((mHeading > 68) && (mHeading <= 113))
        return @"E";
    else if ((mHeading > 113) && (mHeading <= 158))
        return @"SE";
    else if ((mHeading > 158) && (mHeading <= 203))
        return @"S";
    else if ((mHeading > 203) && (mHeading <= 248))
        return @"SW";
    else if ((mHeading > 248) && (mHeading <= 293))
        return @"W";
    else if ((mHeading > 293) && (mHeading <= 338))
        return @"NW";
    else{
        NSLog (@"%f",mHeading);
        return @"Unknown";
    }
}
@end

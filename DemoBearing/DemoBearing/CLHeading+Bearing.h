//
//  CLHeading+Bearing.h
//  DemoBearing
//
//  Created by Marco on 05/09/13.
//  Copyright (c) 2013 Marco Mirisola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Bearing : NSObject
+(NSNumber *) bearingBetweenStartLocation:(CLLocation *)startLocation andEndLocation:(CLLocation *)endLocation;

+(NSString *)getCardinalDirectionFromHeading:(float)mHeading;

@end

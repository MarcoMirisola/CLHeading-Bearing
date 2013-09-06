CLHeading+Bearing
=================

##What is CLHeading+Bearing ?
CLHeading+Bearing is a simple and small objective-C class that allow you to point the compass to a coordinate instead the north.
Also you can get the cardinal point where the device is pointing or in which cardinal point is a location (coordinates). 

## Usage

- Add to you project the CLHeading+Bearing.h header and its implementation CLHeading+Bearing.m and import the .h file in your class.

- In your interface create a NSNumber *bearingDegrees;

- In your viewDidLoad initialize the CLLocationManager

- In the updateLocation delegate get the bearing degrees (NSNumber *bearingDegrees) calling 
		<code>+(NSNumber *) bearingBetweenStartLocation:(CLLocation *)startLocation andEndLocation:(CLLocation *)endLocation;

- In order to apply the image transformation to your "compassimage", in didUpdateHeading delegate you need to do
		<code>_imgCompass.transform = CGAffineTransformMakeRotation(([bearingDegrees intValue] - newHeading.magneticHeading) * M_PI / 180);

- In order to get the cardinal point from bearing, in your didUpdateHeading delegate you need to call
		<code>+(NSString *)getCardinalDirectionFromHeading:(float)heading;


For more info, read the source and the demo project.

## License
CLHeading+Bearing is licensed under the MIT-License


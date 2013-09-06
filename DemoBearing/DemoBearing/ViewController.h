//
//  ViewController.h
//  DemoBearing
//
//  Created by Marco on 05/09/13.
//  Copyright (c) 2013 Marco Mirisola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import "CLHeading+Bearing.h"

@interface ViewController : UIViewController 
@property (nonatomic, weak)IBOutlet UIImageView *imgCompass;
@end

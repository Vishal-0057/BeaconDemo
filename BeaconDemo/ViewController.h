//
//  ViewController.h
//  BeaconDemo
//
//  Created by abhayam rastogi on 7/18/15.
//  Copyright (c) 2015 Intelligrape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property CLLocationManager *locationManager;
@property CLProximity previousProximity;

@property (nonatomic, strong) NSArray *beacons;
@property (nonatomic, strong) NSMutableDictionary *activeBeacons;


@end


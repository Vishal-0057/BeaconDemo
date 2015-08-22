//
//  ViewController.m
//  BeaconDemo
//
//  Created by abhayam rastogi on 7/18/15.
//  Copyright (c) 2015 Intelligrape. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<CLLocationManagerDelegate>

@end

@implementation ViewController

//- (instancetype) init {
//    if (self = [super init]) {
//        
//        self.locationManager = [[CLLocationManager alloc] init];
//        
//        NSArray *iOSversion = [[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."];
//        
//        if ([[iOSversion objectAtIndex:0] integerValue] >= 8) {
//            /*
//             iOS 8.0 And Above
//             */
//            [self.locationManager requestAlwaysAuthorization];
//            [self.locationManager requestWhenInUseAuthorization];
//        } else {
//            [self.locationManager startUpdatingLocation];
//        }
//        [self addBeacons];
//        self.locationManager.pausesLocationUpdatesAutomatically = NO;
//        [self.locationManager setDelegate:self];
////        self.activeBeacons = [];
//        
//    }
//    return self;
//}

- (void) addBeacons {
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"b9407f30-f5f8-466e-aff9-25556b57fe6d"];
    CLBeaconRegion *beaconsRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:55957 minor:34167 identifier:@"com.intelligrape.beacon"];
    [beaconsRegion setNotifyEntryStateOnDisplay:YES];
    [beaconsRegion setNotifyOnEntry:YES];
    [beaconsRegion setNotifyOnExit:YES];
    [self.locationManager startMonitoringForRegion:beaconsRegion];
    [self.locationManager startRangingBeaconsInRegion:beaconsRegion];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self addBeacons];
    self.locationManager = [[CLLocationManager alloc] init];
    
    NSArray *iOSversion = [[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."];
     [self.locationManager setDelegate:self];
    if ([[iOSversion objectAtIndex:0] integerValue] >= 8) {
        /*
         iOS 8.0 And Above
         */
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
    } else {
        [self.locationManager startUpdatingLocation];
    }
    
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
   [self addBeacons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    NSLog(@"did range beacons : %@\n region : %@",beacons, region);
    
    for (CLBeacon *beacon in beacons) {
        
        NSLog(@"UUID : %@\n MAJOR : %@\n MINOR : %@",beacon.proximityUUID, beacon.major, beacon.minor);
        
        switch (beacon.proximity) {
            case CLProximityFar:
                NSLog(@"Far");
                break;
                
            case CLProximityImmediate:
                NSLog(@"immediate");
                break;
                
            case CLProximityNear:
                NSLog(@"near");
                break;
                
            case CLProximityUnknown:
                NSLog(@"Unknown");
                break;
                
            default:
                break;
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region {
    NSLog(@"did enter beaconsregion : %@", region);
}

- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region {
    NSLog(@"did exit region : %@", region);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"did fail with error location : %@", error);
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    NSLog(@"did update to location : %@",locations);
}

@end

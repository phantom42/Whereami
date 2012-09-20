//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Joe Coleman on 9/13/12.
//  Copyright (c) 2012 Joe Coleman. All rights reserved.
//

#import "WhereamiViewController.h"

@interface WhereamiViewController ()

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ;
    
    if (self) {
        
        if ([CLLocationManager locationServicesEnabled])
        {
            // create location manager object
            locationManager = [[CLLocationManager alloc] init] ;
        
            // there will be a warning from this line of code; ignore for now
            [locationManager setDelegate:self] ;
        
            // and we want it to be as accurate as possible
            // regardless of how much time/power it takes
            [locationManager setDesiredAccuracy:kCLLocationAccuracyBest] ;
        
            // set minimum distance change for an update to register
            [locationManager setDistanceFilter:50];
        
            // tell our manager to start looking for its location immediately
            [locationManager startUpdatingLocation] ;
            
            if ([CLLocationManager headingAvailable])
            {
                [locationManager setHeadingFilter:5] ;
                [locationManager startUpdatingHeading] ;
                
            }
        }
        
        
    }
    
    return self ;
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation) ;
}
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"%@", newHeading) ;
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWIthError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error) ;
}

- (void)dealloc
{
    // tell the location manager to stop sending us messages
    [locationManager setDelegate:nil] ;
}



@end

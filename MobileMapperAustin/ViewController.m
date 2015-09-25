//
//  ViewController.m
//  MobileMapperAustin
//
//  Created by Jim & Lisa on 9/14/15.
//  Copyright (c) 2015 Jim Witheril. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property MKPointAnnotation *TexasStateCapitalBuildingAnnotation;
@property CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    double latitude = 30.2746947;
    double longitude = -97.7403227;

    self.TexasStateCapitalBuildingAnnotation = [MKPointAnnotation new];
    self.TexasStateCapitalBuildingAnnotation.coordinate = CLLocationCoordinate2DMake(latitude,longitude);
    self.TexasStateCapitalBuildingAnnotation.title = @"Texas State Capital Building";
    [self.mapView addAnnotation:self.TexasStateCapitalBuildingAnnotation];


    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:@"Zilker Park" completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *place in placemarks)
        {
            MKPointAnnotation *annotation = [MKPointAnnotation new];
            annotation.coordinate = place.location.coordinate;
            annotation.title = place.name;
            [self.mapView addAnnotation:annotation];
        }
    }];

    self.locationManager = [CLLocationManager new];
    [self.locationManager requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;

}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isEqual:mapView.userLocation]) {
        return nil;
    }
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return pin;

}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    CLLocationCoordinate2D centercoordinate = view.annotation.coordinate;

    MKCoordinateSpan span;
    span.latitudeDelta = 0.001;
    span.longitudeDelta = 0.001;

    MKCoordinateRegion region;
    region.center = centercoordinate;
    region.span = span;

    [self.mapView setRegion:region animated:YES];

}

@end







//
//  ViewController.m
//  MobileMapperAustin
//
//  Created by Jim & Lisa on 9/14/15.
//  Copyright (c) 2015 Jim Witheril. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property MKPointAnnotation *TexasStateCapitalBuildingAnnotation;
@property MKPointAnnotation *ZilkerParkAnnotation;
@property MKPointAnnotation *FranklinBarbecueAnnotation;
@property MKPointAnnotation *UniversityofTexasAnnotation;
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


    double latitude1 = 30.2660703;
    double longitude1 = -97.7691348;

    self.ZilkerParkAnnotation = [MKPointAnnotation new];
    self.ZilkerParkAnnotation.coordinate = CLLocationCoordinate2DMake(latitude1,longitude1);
    self.ZilkerParkAnnotation.title = @"Zilker Park";
    [self.mapView addAnnotation:self.ZilkerParkAnnotation];


    double latitude2 = 30.2701188;
    double longitude2 = -97.7312727;

    self.FranklinBarbecueAnnotation = [MKPointAnnotation new];
    self.FranklinBarbecueAnnotation.coordinate = CLLocationCoordinate2DMake(latitude2,longitude2);
    self.FranklinBarbecueAnnotation.title = @"Franklin Barbecue";
    [self.mapView addAnnotation:self.FranklinBarbecueAnnotation];


    double latitude3 = 30.281578;
    double longitude3 = -97.740217;

    self.UniversityofTexasAnnotation = [MKPointAnnotation new];
    self.UniversityofTexasAnnotation.coordinate = CLLocationCoordinate2DMake(latitude3,longitude3);
    self.UniversityofTexasAnnotation.title = @"University of Texas";
    [self.mapView addAnnotation:self.UniversityofTexasAnnotation];

}
@end

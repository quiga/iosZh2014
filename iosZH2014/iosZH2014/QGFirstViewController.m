//
//  QGFirstViewController.m
//  iosZH2014
//
//  Created by PPKE-IMAC-4 on 2014.05.23..
//  Copyright (c) 2014 Quintz Gábor. All rights reserved.
//

#import "QGFirstViewController.h"
#import "QGPin.h"

@interface QGFirstViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation QGFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView setDelegate:self];
    self.mapView.mapType = MKMapTypeHybrid;
    
    float spanX = 0.00001;
    float spanY = 0.00001;
    MKCoordinateRegion region;
    
    region.center.longitude = 19.079752;
    region.center.latitude = 47.487051;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate1;
    coordinate1.longitude = 19.079752;
    coordinate1.latitude = 47.487051;
    
    point.coordinate = coordinate1;
    point.title = @"Pázmány Péter Katolikus Egyetem";
    point.subtitle = @"ITK";
    
    [self.mapView addAnnotation:point];
    [self.mapView setRegion:region animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation {
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorRed;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

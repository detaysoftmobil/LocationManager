//
//  ViewController.m
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Map.h"
#import "SaveLocation.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;
@synthesize bottomToolbar;
@synthesize location;


-(void)dealloc
{
    [mapView release];
    [bottomToolbar release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
    
    location = [[CLLocationManager alloc] init];
    location.delegate = self;
    location.desiredAccuracy = kCLLocationAccuracyBest;
    
   [location startUpdatingLocation];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma Location Manager -
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D new = newLocation.coordinate;
    NSLog(@"%f  %f", new.latitude, new.longitude);
    
    //    new.latitude = 41.02699;
    //    new.longitude = 29.09903;
    
    [location stopUpdatingLocation];
    
    [self createPointOnMap:new.latitude Longtitude:new.longitude title:@"Here" settitle:@"Whatsaa"];
}

#pragma createPointOnMap - 
-(void)createPointOnMap:(double)latitude Longtitude:(double)longtitude title:(NSString *)title settitle:(NSString *)settitle
{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
    region.center.latitude = latitude;
    region.center.longitude = longtitude;
    region.span.longitudeDelta = 0.1f;
    region.span.latitudeDelta = 0.1f;
    
    [mapView setRegion:region animated:YES]; 
    [mapView setDelegate:self];
    
    Annotations *ann = [[Annotations alloc] init];
    ann.title = title;
	ann.subtitle = settitle;
    ann.coordinate = region.center;
    
    [mapView addAnnotation:ann];
}
#pragma mark MKMapViewDelegate
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
	MKOverlayView* overlayView = nil;
	
//	if(overlay == self.routeLine)
//	{
		//if we have not yet created an overlay view for this overlay, create it now. 
		if(nil == routeLineView)
		{
			routeLineView = [[[MKPolylineView alloc] initWithPolyline:routeLine] autorelease];
            routeLineView.fillColor = [UIColor redColor];
			routeLineView.strokeColor = [UIColor redColor];
			routeLineView.lineWidth = 3;
		}
		
		overlayView = routeLineView;
		
//	}
	
	return overlayView;
	
}

#pragma Actions
-(IBAction)saveLocation:(id)sender
{
    
    SaveLocation *saveLocationViewController = [[SaveLocation alloc] init];
    [self.navigationController pushViewController:saveLocationViewController animated:YES];
    [SaveLocation release];
}


@end

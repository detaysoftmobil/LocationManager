//
//  ViewController.h
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>{
    
    MKPolyline* routeLine;
	MKPolylineView* routeLineView;
}

@property(nonatomic,retain)IBOutlet MKMapView *mapView;
@property(nonatomic,retain)IBOutlet UIToolbar *bottomToolbar;
@property(nonatomic,retain)CLLocationManager *location;

-(IBAction)saveLocation:(id)sender;

@end
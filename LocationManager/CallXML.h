//
//  CallXML.h
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CallXML : NSObject<UIAlertViewDelegate>{
    
    NSMutableData *webData;
    BOOL isConnectionFinished;
}


@property(nonatomic, retain) NSMutableData *webData;


-(NSString*)getXML:(double)_latitude1 Longtitude1:(double)_longtitude1 LatitudeDestination:(double)_latitude2 LongtitudeDestination:(double)_longtitude2;
-(void)callGoogleMapDirectionsXML:(double)_latitude1 Longtitude1:(double)_longtitude1 LatitudeDestination:(double)_latitude2 LongtitudeDestination:(double)_longtitude2;

@end
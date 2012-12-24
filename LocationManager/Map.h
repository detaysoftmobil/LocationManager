//
//  MapClass.h
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface Map : NSObject


+(NSString*)getXMLResponse;
+(void)setXMLResponse:(NSString*)_getXMLResponsestr;

@end


// Annatations
@interface Annotations : NSObject <MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end

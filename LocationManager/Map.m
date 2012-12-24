//
//  MapClass.m
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Map.h"

@implementation Map
static NSString *_xmlResponse = nil;


+(NSString*)getXMLResponse{
    
    return _xmlResponse;
}
+(void)setXMLResponse:(NSString*)_getXMLResponsestr{
    
    if (_xmlResponse != _getXMLResponsestr) {
        _xmlResponse = nil;
        _xmlResponse = [_getXMLResponsestr retain];
    }
}

@end


// Annotations
@implementation Annotations

@synthesize subtitle,title,coordinate;

-(void)dealloc{
	[super dealloc];
}

@end

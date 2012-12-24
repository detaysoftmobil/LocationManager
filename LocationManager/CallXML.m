//
//  CallXML.m
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CallXML.h"


@implementation CallXML
@synthesize webData;

static NSString *getResponseXml = nil;


-(NSString*)getXML:(double)_latitude1 Longtitude1:(double)_longtitude1 LatitudeDestination:(double)_latitude2 LongtitudeDestination:(double)_longtitude2{
    
    
    [self callGoogleMapDirectionsXML:_latitude1 Longtitude1:_longtitude1 LatitudeDestination:_latitude2 LongtitudeDestination:_longtitude2];
    
    // check if connection finished
    while (isConnectionFinished == NO) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
    }
    
    //get the XML   
    if (getResponseXml == Nil) {
    }
    else
    {
        return getResponseXml;
    }
    
    return nil;
}

-(void)callGoogleMapDirectionsXML:(double)_latitude1 Longtitude1:(double)_longtitude1 LatitudeDestination:(double)_latitude2 LongtitudeDestination:(double)_longtitude2{
    
    NSString *srtURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/directions/xml?origin=%f,%f&destination=%f,%f&sensor=false", _latitude1,_longtitude1,_latitude2,_longtitude2];
    
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:srtURL]];
    
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [theConnection start]; 
    
	if( theConnection )
	{
		webData = [[NSMutableData data] retain];
	}
	else
	{
//        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Connection Error E07" message:nil delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
//        [alertview show];
//        [alertview release];
	}
    
    
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	[connection release];
	[webData release];
    isConnectionFinished = YES;
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSLog(@"DONE. Received Bytes: %d000", [webData length]);
    NSString *theXML = [[NSString alloc] 
                        initWithBytes: [webData mutableBytes] 
                        length:[webData length] 
                        encoding:NSUTF8StringEncoding];
    
    // Connection finished
    isConnectionFinished = YES;
    getResponseXml = [[NSString alloc] initWithString:theXML];
       NSLog(theXML);
    
    [theXML release];   
	[connection release];
	[webData release];
}


@end

//
//  XMLParser.m
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"
#import "CallXML.h"
#import "Map.h"

@implementation XMLParser
@synthesize currentString,saveString;

static NSString *_Overlay_point    = @"copyrights";
static NSString *_points           = @"points";
static bool enableWrite = NO;

-(void)parseXML:(double)_latitude1 Longtitude1:(double)_longtitude1 LatitudeDestination:(double)_latitude2 LongtitudeDestination:(double)_longtitude2{
    
    
    CallXML *callxml = [[CallXML alloc] init];
    
    //    NSString *myXML = [[NSString alloc]initWithString:[callxml getXML:_latitude1 Longtitude1:_longtitude1 LatitudeDestination:_latitude2 LongtitudeDestination:_longtitude2]];
    NSString *myXML = [callxml getXML:_latitude1 Longtitude1:_longtitude1 LatitudeDestination:_latitude2 LongtitudeDestination:_longtitude2];
    
    if (myXML == nil) {
        NSLog(@"Hata");
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Connection Error E08" message:nil delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
        [alertview show];
        [alertview release];
        
        [Map setXMLResponse:nil];
        
    }
    else
    {
        
        BOOL success;
        
        // initialize current string
        self.currentString = [NSMutableString string];
        
        // set save string NO
        saveString = NO;
        
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[myXML dataUsingEncoding: NSUTF8StringEncoding]];
        [parser setDelegate:self];
        [parser setShouldResolveExternalEntities:YES];
        success = [parser parse];
        
        self.currentString = nil;
        [parser release];
    }
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict 
{
    
    if ([elementName isEqualToString:_Overlay_point])
    {
        [currentString setString:@""];
        //saveString = YES;
    }
    else if ([elementName isEqualToString:_points])
    {
        [currentString setString:@""];
        saveString = YES;
    }
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (saveString) [currentString appendString:string];
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    
    if ([elementName isEqualToString:_Overlay_point])
    {
        enableWrite = YES;
    }
    else if ([elementName isEqualToString:_points])
    {
        if (enableWrite) {
            [Map setXMLResponse:[[NSString alloc]initWithString:currentString]];
            enableWrite = NO;
        }
        
    }
    
}
// Error handling in XML
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString *error=[NSString stringWithFormat:@"Error %i, Description: %@, Line: %i, Column: %i", 
					 [parseError code],
					 [[parser parserError] localizedDescription], 
					 [parser lineNumber],
					 [parser columnNumber]];
	
	NSLog(@"%@",error);
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Connection Error E09" message:nil delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
    [alertview show];
    [alertview release];
}


@end


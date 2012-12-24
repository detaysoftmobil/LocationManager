//
//  XMLParser.h
//  LocationManager
//
//  Created by Tahir on 11/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject<NSXMLParserDelegate>{
    
    NSMutableString *currentString;
    BOOL saveString;
    
}
@property(nonatomic,retain)NSMutableString *currentString;
@property(nonatomic)BOOL saveString;


-(void)parseXML:(double)_latitude1 Longtitude1:(double)_longtitude1 LatitudeDestination:(double)_latitude2 LongtitudeDestination:(double)_longtitude2;

@end

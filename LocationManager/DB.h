//
//  DB.h
//  LocationManager
//
//  Created by Tahir Öz on 12/21/12.
//
//

#import <Foundation/Foundation.h>

@interface DB : NSObject

-(void)saveLocationIntoDB:(double)langtitude Longtitude:(double)longtitude pinColor:(NSString*)pinColor title:(NSString*)title telephone:(NSString*)telephone email:(NSString*)email;


@end

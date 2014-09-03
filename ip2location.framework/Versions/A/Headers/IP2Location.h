//
//  ip2location.h
//  ip2location
//
//  Created by Олександр Мовчан on 21.08.14.
//  Copyright (c) 2014 NotusGames. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPLocationRecord : NSObject

@property (readonly) NSString *countryShort;
@property (readonly) NSString *countryLong;
@property (readonly) NSString *region;
@property (readonly) NSString *city;
@property (readonly) NSString *isp;
@property (readonly) float latitude;
@property (readonly) float longitude;
@property (readonly) NSString *domain;
@property (readonly) NSString *zipcode;
@property (readonly) NSString *timezone;
@property (readonly) NSString *netspeed;
@property (readonly) NSString *iddcode;
@property (readonly) NSString *areacode;
@property (readonly) NSString *weatherstationcode;
@property (readonly) NSString *weatherstationname;
@property (readonly) float elevation;
@property (readonly) NSString *usagetype;

@end

typedef enum {
	IP2LOCATION_MEMORY_FILE_IO,
	IP2LOCATION_MEMORY_CACHE,
	IP2LOCATION_MEMORY_SHARED
} IPLocationMemType;


/*
	IP2Location database interface
*/	
@interface IPLocation : NSObject

-(id) initWithDataPath: (NSString*) dataPath;
-(id) initWithDataPath: (NSString*) dataPath andMemoryType: (IPLocationMemType) memoryType;
-(void) setMemoryType: (IPLocationMemType) memoryType;

-(IPLocationRecord*) recordWithIP: (NSString*) ipAddress;

-(IPLocationRecord*) countryShortWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) countryLongWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) regionWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) cityWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) ispWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) latitudeWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) longitudeWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) domainWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) zipcodeWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) timezoneWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) netspeedWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) iddcodeWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) areacodeWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) weatherstationcodeWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) weatherstationnameWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) mccWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) mncWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) mobilebrandWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) elevationWithIP: (NSString*) ipAddress;
-(IPLocationRecord*) usagetypeWithIP: (NSString*) ipAddress;

@end

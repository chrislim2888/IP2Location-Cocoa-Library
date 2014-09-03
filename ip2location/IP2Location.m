//
//  ip2location.m
//  ip2location
//
//  Created by Олександр Мовчан on 21.08.14.
//  Copyright (c) 2014 NotusGames. All rights reserved.
//

#import "IP2Location.h"
#import "libIP2Location/IP2Location.h"


@interface IPLocationRecord ()
{
	IP2LocationRecord *record;
}
-(id) initWithIP2LocationRecord: (IP2LocationRecord*) rec;
@end

@implementation IPLocationRecord

-(id) initWithIP2LocationRecord: (IP2LocationRecord*) rec
{
	self = [super init];
	record = rec;
	return self;
}

-(void) dealloc
{
	IP2Location_free_record(record);
	record = nil;
	[super dealloc];
}

#define STRING_PROPERTY(a)		- (NSString *)a	{ return [NSString stringWithUTF8String:record->a]; }
#define STRING_PROPERTY_2(a,b)	- (NSString *)a	{ return [NSString stringWithUTF8String:record->b]; }
#define FLOAT_PROPERTY(a)		- (float)a		{ return record->a; }

STRING_PROPERTY_2(countryShort,country_short);
STRING_PROPERTY_2(countryLong,country_long);
STRING_PROPERTY(region);
STRING_PROPERTY(city);
STRING_PROPERTY(isp);
FLOAT_PROPERTY(latitude);
FLOAT_PROPERTY(longitude);
STRING_PROPERTY(domain);
STRING_PROPERTY(zipcode);
STRING_PROPERTY(timezone);
STRING_PROPERTY(netspeed);
STRING_PROPERTY(iddcode);
STRING_PROPERTY(areacode);
STRING_PROPERTY(weatherstationcode);
STRING_PROPERTY(weatherstationname);
STRING_PROPERTY(mcc);
STRING_PROPERTY(mnc);
STRING_PROPERTY(mobilebrand);
FLOAT_PROPERTY(elevation);
STRING_PROPERTY(usagetype);

- (NSString *)description
{
	return [NSString stringWithFormat:
			@"Country short: %@\n"
			@"Country long: %@\n"
			@"Region: %@\n"
			@"City: %@\n"
			@"ISP: %@ \n"
			@"Latitude: %f\n"
			@"Longitude: %f\n"
			@"Domain: %@\n"
			@"Zipcode: %@\n"
			@"Timezone: %@\n"
			@"Netspeed: %@\n"
			@"IDDCode: %@\n"
			@"Areacode: %@\n"
			@"Weather Station Code: %@\n"
			@"Weather Station Name: %@\n"
			@"MCC: %@\n"
			@"MNC: %@\n"
			@"Mobile Brand: %@\n"
			@"Elevation: %f\n"
			@"Usage Type: %@\n",
			self.countryShort,
			self.countryLong,
			self.region,
			self.city,
			self.isp,
			self.latitude,
			self.longitude,
			self.domain,
			self.zipcode,
			self.timezone,
			self.netspeed,
			self.iddcode,
			self.areacode,
			self.weatherstationcode,
			self.weatherstationname,
			self.mcc,
			self.mnc,
			self.mobilebrand,
			self.elevation,
			self.usagetype];
}


@end

@interface IPLocation ()
{
	IP2Location *db;
}
@end

@implementation IPLocation

-(id) initWithDataPath: (NSString*) dataPath
{
	self = [super init];
	db = IP2Location_open((char *)[dataPath fileSystemRepresentation]);
	if(db==nil)
	{
		[self release];
		return nil;
	}
	return self;
}

-(id) initWithDataPath: (NSString*) dataPath andMemoryType: (IPLocationMemType) memoryType
{
	self = [self initWithDataPath: dataPath];
    [self setMemoryType: memoryType];
	return self;
}

-(void) setMemoryType: (IPLocationMemType) memoryType
{
    if(memoryType==IP2LOCATION_MEMORY_CACHE)
		IP2Location_open_mem(db, IP2LOCATION_CACHE_MEMORY);
	else if(memoryType==IP2LOCATION_MEMORY_SHARED)
		IP2Location_open_mem(db, IP2LOCATION_SHARED_MEMORY);
}

-(void) dealloc
{
	IP2Location_close(db);
	db = nil;
	[super dealloc];
}
	
-(IPLocationRecord*) recordWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_all(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];
}


-(IPLocationRecord*) countryShortWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_country_short(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) countryLongWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_country_long(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) regionWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_region(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) cityWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_city(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) ispWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_isp(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) latitudeWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_latitude(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) longitudeWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_longitude(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) domainWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_domain(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) zipcodeWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_zipcode(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) timezoneWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_timezone(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) netspeedWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_netspeed(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) iddcodeWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_iddcode(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) areacodeWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_areacode(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) weatherstationcodeWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_weatherstationcode(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) weatherstationnameWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_weatherstationname(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) mccWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_mcc(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) mncWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_mnc(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) mobilebrandWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_mobilebrand(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) elevationWithIP: (NSString*) ipAddress
{
	IP2LocationRecord *rec = IP2Location_get_elevation(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}
	
-(IPLocationRecord*) usagetypeWithIP: (NSString*) ipAddress{
	IP2LocationRecord *rec = IP2Location_get_usagetype(db, (char *)[ipAddress UTF8String]);
	if(rec==NULL)
		return nil;
	return [[[IPLocationRecord alloc] initWithIP2LocationRecord: rec] autorelease];	
}




@end

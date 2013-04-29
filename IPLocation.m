#import "IPLocation.h"
#include "IP2Location.h"
#import <Foundation/NSString.h>
#import <Foundation/NSPathUtilities.h>

@implementation IPLocation

- (id)initWithIP:(NSString *)ipAddress path:(NSString *)path
{
	self = [super init];
	if (self != nil) {
		IP2Location *IP2LocationObj = IP2Location_open((char *)[path fileSystemRepresentation]);
		if (IP2LocationObj == NULL) {
			[self release];
			return nil;
		}
		
		record = IP2Location_get_all(IP2LocationObj, (char *)[ipAddress UTF8String]);
		IP2Location_close(IP2LocationObj);
		
		if (record == NULL) {
			[self release];
			return nil;
		}
	}
	return self;
}

+ (IPLocation *)locationWithIP:(NSString *)ipAddress dataPath:(NSString *)dataPath
{
	return [[[self alloc] initWithIP:ipAddress path:dataPath] autorelease];
}

- (void)dealloc
{
	if (record) {
		IP2Location_free_record(record);
	}
	[super dealloc];
}

#define STRING_PROPERTY(a)		- (NSString *)a	{ return [NSString stringWithUTF8String:record->a]; }
#define STRING_PROPERTY_2(a,b)	- (NSString *)a	{ return [NSString stringWithUTF8String:record->b]; }
#define FLOAT_PROPERTY(a)		- (float)a		{ return record->a; }

STRING_PROPERTY_2(countryShort,country_short)
STRING_PROPERTY_2(countryLong,country_long)
STRING_PROPERTY(region)
STRING_PROPERTY(city)
STRING_PROPERTY(isp)
FLOAT_PROPERTY(latitude)
FLOAT_PROPERTY(longitude)
STRING_PROPERTY(domain)
STRING_PROPERTY(zipcode)
STRING_PROPERTY(timezone)
STRING_PROPERTY(netspeed)
STRING_PROPERTY(iddcode)
STRING_PROPERTY(areacode)
STRING_PROPERTY(weatherstationcode)
STRING_PROPERTY(weatherstationname)
STRING_PROPERTY(mcc)
STRING_PROPERTY(mnc)
STRING_PROPERTY(mobilebrand)
STRING_PROPERTY(elevation)
STRING_PROPERTY(usagetype)

- (NSString *)description
{
	return [NSString stringWithFormat:
			@"Country short: %@\n"
			@"Country long: %@\n"
			@"Region: %@\n"
			@"City: %@\n"
			@"ISP: %@\n"
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
			@"Mobile Brand: %@\n",
			@"Elevation: %@\n",
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

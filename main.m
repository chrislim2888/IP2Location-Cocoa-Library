#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSString.h>
#import "IPLocation.h"

int main (int argc, const char *argv[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSString *dataPath = @"IP-COUNTRY-REGION-CITY-LATITUDE-LONGITUDE-ZIPCODE-TIMEZONE-ISP-DOMAIN-NETSPEED-AREACODE-WEATHER-MOBILE-SAMPLE.BIN";
	NSString *ip = @"55.207.38.82";
	IPLocation *loc = [IPLocation locationWithIP:ip dataPath:dataPath];
	printf("* * * * * IP %s * * * * *:\n%s", [ip UTF8String], [[loc description] UTF8String]);
	
	[pool drain];
	return 0;
}

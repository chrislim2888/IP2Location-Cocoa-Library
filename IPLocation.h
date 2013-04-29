#import <Foundation/NSObject.h>
#include "IP2Location.h"

@class NSString;

@interface IPLocation : NSObject
{
	IP2LocationRecord *record;
}

+ (IPLocation *)locationWithIP:(NSString *)ipAddress dataPath:(NSString *)dataPath;

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
@property (readonly) NSString *elevation;
@property (readonly) NSString *usagetype;

@end

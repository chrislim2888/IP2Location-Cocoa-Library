//
//  main.m
//  sample
//
//  Created by Олександр Мовчан on 02.09.14.
//  Copyright (c) 2014 NotusGames. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ip2location/IP2Location.h>


void test(NSString *dbPath)
{
    //open database
    IPLocation *locationDB = [[IPLocation alloc] initWithDataPath: dbPath];
    
    //set memory cache type
    [locationDB setMemoryType: IP2LOCATION_MEMORY_CACHE];
    
    //search
    IPLocationRecord *rec =  [locationDB recordWithIP: @"8.8.8.8"];
    NSLog(@"%@", rec.countryShort);
}


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSString *filename = [NSString stringWithUTF8String:__FILE__];

        test([[filename stringByDeletingLastPathComponent] stringByAppendingPathComponent: @"../data/IP-COUNTRY-SAMPLE.BIN"]);
        test([[filename stringByDeletingLastPathComponent] stringByAppendingPathComponent: @"../data/IPV6-COUNTRY-SAMPLE.BIN"]);
    }
    return 0;
}


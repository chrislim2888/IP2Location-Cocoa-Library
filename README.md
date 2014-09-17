# IP2Location Cocoa 7.0.0
This is IP2Location Cocoa library that enables the user to find the country, region (state), city, latitude, longitude, zip code, time zone, ISP, domain name, connection type, area code, weather, mobile network, elevation, and usage type by IP address or hostname originates from.  The library reads the geo location information
from **IP2Location BIN data** file.

Supported IPv4 and IPv6 address.

For more details, please visit:
[http://www.ip2location.com/developers/cocoa](http://www.ip2location.com/developers/cocoa)


#Installation (Mac OS X)
1. Download and decompress ip2location-cocoa-x.x.x.zip
2. For Xcode usage:
	a. Add ip2location.framework to your Xcode project by dragging and dropping it into Project Navigator
	b. In your appropriate target, under "Build Settings", select "Runpath Search Paths" in the "Linking" category, and enter "@loader_path/../Frameworks" (without the quotes).
	c. Build your project
3. For build from command line or makefile
	a. Copy ip2location.framework to your working directory
	b. Build and link your target with following options added (without the quotes): "-F. -L. -Wl,-framework,ip2location -Wl,-framework,Foundation"
	c. Change linked framework path in your binary: "install_name_tool -change @rpath/ip2location.framework/Versions/A/ip2location ip2location.framework/Versions/A/ip2location binary_executable"


# Sample BIN Databases
* Download free IP2Location LITE databases at [http://lite.ip2location.com](http://lite.ip2location.com)  
* Download IP2Location sample databases at [http://www.ip2location.com/developers](http://www.ip2location.com/developers)

# Support
Email: support@ip2location.com.  
URL: [http://www.ip2location.com](http://www.ip2location.com)

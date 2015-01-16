#import "WordPressComApiCredentials.h"

#define WPCOM_API_CLIENT_ID @"38337" // se@mixpanel.com
#define WPCOM_API_CLIENT_SECRET @"TA1pdnRwuSZTklOX3z5xi4nUzS1ORDZUGDHwAyXGZbRiYEXw5IRvB5IZ6q0CLmwX"

@implementation WordPressComApiCredentials

+ (NSString *)client {
    return WPCOM_API_CLIENT_ID;
}

+ (NSString *)secret {
    return WPCOM_API_CLIENT_SECRET;
}

// Wordpress project token: 76aee50209c702b0b67f048aa602ef05
+ (NSString *)mixpanelAPIToken {
    return @"";
}

+ (NSString *)pocketConsumerKey {
    return @"";
}

+ (NSString *)crashlyticsApiKey {
    return @"";
}

+ (NSString *)hockeyappAppId {
    return @"";
}
    
+ (NSString *)googlePlusClientId {
    return @"";
}

+ (NSString *)simperiumAppId {
	return @"";
}

+ (NSString *)simperiumAPIKey {
	return @"";
}

+ (NSString *)helpshiftAPIKey {
    return  @"";
}

+ (NSString *)helpshiftDomainName {
    return @"";
}

+ (NSString *)helpshiftAppId {
    return @"";
}

+ (NSString *)taplyticsAPIKey {
    return @"";
}

@end

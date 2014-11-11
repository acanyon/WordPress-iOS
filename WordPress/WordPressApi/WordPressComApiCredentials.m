#import "WordPressComApiCredentials.h"

#define WPCOM_API_CLIENT_ID @"36718"
#define WPCOM_API_CLIENT_SECRET @"UFk9nhffbDQymka9AIevcniNIVP4lCQMR8SRFBteQ6xbdNhfBuuSklENE2eihBQZ"

@implementation WordPressComApiCredentials

+ (NSString *)client {
    return WPCOM_API_CLIENT_ID;
}

+ (NSString *)secret {
    return WPCOM_API_CLIENT_SECRET;
}

+ (NSString *)mixpanelAPIToken {
    return @"76aee50209c702b0b67f048aa602ef05";
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

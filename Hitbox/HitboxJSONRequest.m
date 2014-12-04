#import "HitboxJSONRequest.h"

#import "HitboxJSONResponse.h"


@implementation HitboxJSONRequest

- (Class)responseClass
{
	return HitboxJSONResponse.class;
}

- (NSMutableURLRequest *)URLRequest
{
	NSMutableURLRequest *URLRequest = super.URLRequest;
	
	return URLRequest;
}

@end

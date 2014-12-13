#import "HitboxStreamIngestRequest.h"

#import "HitboxAuthorization.h"
#import "HitboxStreamIngestResponse.h"


@interface HitboxStreamIngestRequest ()

@property (nonatomic, strong) HitboxAuthorization *authorization;

@end


@implementation HitboxStreamIngestRequest

- (instancetype)initWithAuthorization:(HitboxAuthorization *)authorization
{
	self = [super init];
	if(self != nil)
	{
		self.authorization = authorization;
	}
	return self;
}

- (Class)responseClass
{
	return HitboxStreamIngestResponse.class;
}

- (NSURL *)URL
{
	// see: http://developers.hitbox.tv/ingesting

	HitboxAuthorization *authorization = self.authorization;
	
	NSURLComponents *components = [[NSURLComponents alloc] initWithURL:self.class.baseURL resolvingAgainstBaseURL:NO];
	components.path = [[components.path stringByAppendingPathComponent:@"streamingest"] stringByAppendingPathComponent:authorization.username];
	components.query = [NSString stringWithFormat:@"authToken=%@", authorization.authToken];

	return components.URL;
}

@end

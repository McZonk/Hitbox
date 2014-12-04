#import "HitboxStreamIngestRequest.h"

#import "HitboxAuthToken.h"
#import "HitboxStreamIngestResponse.h"


@interface HitboxStreamIngestRequest ()

@property (nonatomic, strong) HitboxAuthToken *authToken;

@end


@implementation HitboxStreamIngestRequest

- (instancetype)initWithAuthToken:(HitboxAuthToken *)authToken
{
	self = [super init];
	if(self != nil)
	{
		self.authToken = authToken;
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

	HitboxAuthToken *authToken = self.authToken;
	
	NSURLComponents *components = [[NSURLComponents alloc] initWithURL:self.class.baseURL resolvingAgainstBaseURL:NO];
	components.path = [[components.path stringByAppendingPathComponent:@"streamingest"] stringByAppendingPathComponent:authToken.username];
	components.query = [NSString stringWithFormat:@"authToken=%@", authToken.authToken];

	return components.URL;
}

@end

#import "HitboxAuthTokenResponse.h"

#import "HitboxAuthorization.h"
#import "HitboxAuthTokenRequest.h"


@interface HitboxAuthTokenResponse ()

@property (nonatomic, strong) HitboxAuthorization *authorization;

@end


@implementation HitboxAuthTokenResponse

- (instancetype)initWithRequest:(HitboxURLRequest *)request JSON:(NSDictionary *)JSON error:(NSError **)error
{
	self = [super initWithRequest:request];
	if(self != nil)
	{
		NSString *username = ((HitboxAuthTokenRequest *)request).username;
		if(username == nil)
		{
			// TODO: error handling
			return nil;
		}
		
		NSString *authToken = JSON[@"authToken"];
		if(authToken == nil)
		{
			// TODO: error handling
			return nil;
		}
		
		self.authorization = [[HitboxAuthorization alloc] initWithUsername:username authToken:authToken];
	}
	return self;
}

@end

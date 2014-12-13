#import "HitboxAuthorization.h"


@interface HitboxAuthorization ()

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *authToken;

@end


@implementation HitboxAuthorization

- (instancetype)initWithUsername:(NSString *)username authToken:(NSString *)authToken
{
	self = [super init];
	if(self != nil)
	{
		if(username == nil)
		{
			return nil;
		}
		self.username = username;
		
		if(authToken == nil)
		{
			return nil;
		}
		self.authToken = authToken;
	}
	return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
	return [[HitboxAuthorization alloc] initWithUsername:self.username authToken:self.authToken];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p username='%@' authToken='%@'>", self.class, self, self.username, self.authToken != nil ? @"***" : nil];
}

@end

#import "HitboxAuthToken.h"


@interface HitboxAuthToken ()

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *authToken;

@end


@implementation HitboxAuthToken

- (instancetype)initWithUsername:(NSString *)username authToken:(NSString *)authToken
{
	self = [super init];
	if(self != nil)
	{
		self.username = username;
		self.authToken = authToken;
	}
	return self;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
	return [[HitboxAuthToken alloc] initWithUsername:self.username authToken:self.authToken];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p username='%@' authToken='%@'>", self.class, self, self.username, self.authToken != nil ? @"***" : nil];
}

@end

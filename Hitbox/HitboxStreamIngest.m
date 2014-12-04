#import "HitboxStreamIngest.h"


@interface HitboxStreamIngest ()

@property (nonatomic, copy) NSURL *URL;
@property (nonatomic, copy) NSString *name;

@end


@implementation HitboxStreamIngest

- (instancetype)initWithURL:(NSURL *)URL name:(NSString *)name
{
	self = [super init];
	if(self != nil)
	{
		self.URL = URL;
		self.name = name;
	}
	return self;
}

- (NSURL *)URLWithStreamPath:(NSString *)streamPath
{
	// cannot use URLByAppendingPathComponent: here because it will replace the '?'
	return [NSURL URLWithString:[self.URL.absoluteString stringByAppendingString:streamPath]];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p URL:%@ name:%@>", self.class, self, self.URL, self.name];
}

@end

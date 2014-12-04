#import "NSHTTPURLResponse+HitboxHeaderFields.h"


@implementation NSHTTPURLResponse (HitboxHeaderFields)

- (NSString *)hitbox_contentType
{
	return self.allHeaderFields[@"Content-Type"];
}

- (NSNumber *)hitbox_contentLength
{
	NSString *value = self.allHeaderFields[@"Content-Length"];
	if(value == nil)
	{
		return nil;
	}
	
	NSScanner *scanner = [NSScanner scannerWithString:value];
	
	long long length = 0;
	if(![scanner scanLongLong:&length])
	{
		return nil;
	}
	
	return [NSNumber numberWithLongLong:length];
}

@end

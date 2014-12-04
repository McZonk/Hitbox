#import "HitboxURLConnection+SharedOperationQueue.h"

@implementation HitboxURLConnection (SharedOperationQueue)

+ (NSOperationQueue *)sharedOperationQueue
{
	static NSOperationQueue *operationQueue = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		operationQueue = [[NSOperationQueue alloc] init];
		operationQueue.name = @"HitboxURLConnection";
	});
	
	return operationQueue;
}

@end

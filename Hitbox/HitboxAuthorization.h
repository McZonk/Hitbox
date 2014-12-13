#import <Foundation/Foundation.h>


@interface HitboxAuthorization : NSObject <NSCopying>

- (instancetype)initWithUsername:(NSString *)username authToken:(NSString *)authToken;

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *authToken;

@end

#import <Foundation/Foundation.h>


@interface HitboxAuthToken : NSObject

- (instancetype)initWithUsername:(NSString *)username authToken:(NSString *)authToken;

@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *authToken;

@end

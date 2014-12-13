//
//  Hitbox.h
//  Hitbox
//
//  Created by Maximilian Christ on 03/12/14.
//  Copyright (c) 2014 McZonk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//! Project version number for Hitbox.
FOUNDATION_EXPORT double HitboxVersionNumber;

//! Project version string for Hitbox.
FOUNDATION_EXPORT const unsigned char HitboxVersionString[];



#import "NSHTTPURLResponse+HitboxHeaderFields.h"
#import "NSURLComponents+HitboxQueryComponents.h"

#import "HitboxURLConnection.h"
#import "HitboxURLConnection+SharedOperationQueue.h"
#import "HitboxURLRequest.h"
#import "HitboxURLResponse.h"

#import "HitboxJSONRequest.h"
#import "HitboxJSONResponse.h"

#import "HitboxAuthorization.h"
#import "HitboxAuthTokenRequest.h"
#import "HitboxAuthTokenResponse.h"

#import "HitboxStreamIngest.h"
#import "HitboxStreamIngestRequest.h"
#import "HitboxStreamIngestResponse.h"

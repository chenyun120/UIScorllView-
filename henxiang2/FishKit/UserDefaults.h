//
//  UserDefaults.h
//  mplus
//
//  Created by Chenyun on 14-10-20.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CacheProtocol.h"
@interface UserDefaults : NSObject <CacheProtocol>
//AS_SINGLETON(UserDefaults)
@end

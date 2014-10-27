//
//  CacheProtocol.h
//  mplus
//
//  Created by Chenyun on 14-10-20.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CacheProtocol <NSObject>
- (id)objectForKey:(id)key;
- (void)setObject:(id)object forKey:(id)key;
- (void)removeObjectForKey:(id)key;
@end

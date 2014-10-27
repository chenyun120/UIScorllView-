//
//  NSString+FishKit.h
//  Common
//
//  Created by QFish on 8/10/14.
//  Copyright (c) 2014 iNoknok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FishKit)

/**
 *  @brief 判断是否是邮箱
 *
 *  @return 是否是邮箱
 */
- (BOOL)isEmail;

/**
 *
 * MD5
 *
 */
- (NSString *)MD5;

@end

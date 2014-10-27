//
//  NSObject+FishUserDefaults.m
//  mplus
//
//  Created by Chenyun on 14-10-20.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "NSObject+FishUserDefaults.h"

@implementation NSObject (FishUserDefaults)

+ (NSString *)persistenceKey:(NSString *)key
{
	if ( key )
	{
		key = [NSString stringWithFormat:@"%@.%@", [self description], key];
	}
	else
	{
		key = [NSString stringWithFormat:@"%@", [self description]];
	}
	
	key = [key stringByReplacingOccurrencesOfString:@"." withString:@"_"];
	key = [key stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
	key = [key stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
	
	return key.uppercaseString;
}

+ (id)userDefaultsRead:(NSString *)key
{
	if ( nil == key )
		return nil;
	
	key = [self persistenceKey:key];
	
	return nil;
//	return [[UserDefaults sharedInstance] objectForKey:key];
}

+ (void)userDefaultsWrite:(id)value forKey:(NSString *)key
{
	if ( nil == key || nil == value )
		return;
	
	key = [self persistenceKey:key];

//	[[UserDefaults sharedInstance] setObject:value forKey:key];
}

+ (void)userDefaultsRemove:(NSString *)key
{
	if ( nil == key )
		return;
	
	key = [self persistenceKey:key];
	
//	[[UserDefaults sharedInstance] removeObjectForKey:key];
}

- (id)userDefaultsRead:(NSString *)key
{
	return [[self class] userDefaultsRead:key];
}

- (void)userDefaultsWrite:(id)value forKey:(NSString *)key
{
	[[self class] userDefaultsWrite:value forKey:key];
}

- (void)userDefaultsRemove:(NSString *)key
{
	[[self class] userDefaultsRemove:key];
}

@end

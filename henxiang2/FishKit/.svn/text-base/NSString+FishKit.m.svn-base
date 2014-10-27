//
//  NSString+FishKit.m
//  Common
//
//  Created by QFish on 8/10/14.
//  Copyright (c) 2014 iNoknok. All rights reserved.
//

#import "NSString+FishKit.h"
#import "NSData+Md5.h"

@implementation NSString (FishKit)

- (BOOL)isEmail
{
    return NSNotFound != [self rangeOfString:@"@"].location;
}

- (NSString *)MD5
{
	NSData * value;
	
	value = [NSData dataWithBytes:[self UTF8String] length:[self length]];
	value = [value MD5];

	if ( value )
	{
		char			tmp[16];
		unsigned char *	hex = (unsigned char *)malloc( 2048 + 1 );
		unsigned char *	bytes = (unsigned char *)[value bytes];
		unsigned long	length = [value length];
		
		hex[0] = '\0';
		
		for ( unsigned long i = 0; i < length; ++i )
		{
			sprintf( tmp, "%02X", bytes[i] );
			strcat( (char *)hex, tmp );
		}
		
		NSString * result = [NSString stringWithUTF8String:(const char *)hex];
		free( hex );
		return result;
	}
	else
	{
		return nil;
	}
}

@end

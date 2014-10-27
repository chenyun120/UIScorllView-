//
//  UIImage+FishKit.m
//  Foomoo
//
//  Created by purplepeng on 14-6-7.
//  Copyright (c) 2014年 QFish.inc. All rights reserved.
//

#import "UIImage+FishKit.h"

@implementation UIImage (FishKit)

- (UIImage *)scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end

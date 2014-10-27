//
//  UIViewController+UINavigationItem.h
//  mplus
//
//  Created by QFish on 10/15/14.
//  Copyright (c) 2014 geek-zoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UINavigationItem)

/**
 *  Default target is self, action is 
 */
@property (nonatomic, strong) id navigationItemLeft;
@property (nonatomic, strong) id navigationItemRight;

@end

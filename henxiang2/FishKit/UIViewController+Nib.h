//
//  UIViewController+Nib.h
//  Foomoo
//
//  Created by QFish on 5/5/14.
//  Copyright (c) 2014 QFish.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Nib)

+ (instancetype)loadFromNib;
+ (instancetype)loadFromStoryBoard:(NSString *)storyBoard;
+ (instancetype)loadInitialViewControllerFromStoryBoard:(NSString *)storyBoard;

/**
 *  @brief 自定义界面，如尺寸，位置
 */
- (void)customize;

@end

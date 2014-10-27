//
//  UIView+Nib.h
//  Foomoo
//
//  Created by QFish on 5/4/14.
//  Copyright (c) 2014 QFish.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Nib)

+ (instancetype)loadFromNib;
+ (instancetype)loadFromNibWithFrame:(CGRect)frame;

- (void)customize;

@end

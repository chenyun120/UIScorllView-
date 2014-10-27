//
//  UIView+NibStyle.h
//  mplus
//
//  Created by QFish on 10/16/14.
//  Copyright (c) 2014 geek-zoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIStyler <NSObject>
@property (nonatomic) NSDictionary * styles;
@end

@interface UIView (NibStyle)

#pragma mark -

@property (nonatomic) NSString * nibBackgroundColor;
@property (nonatomic) NSString * nibBorderColor;
@property (nonatomic) NSNumber * nibBorderWidth;
@property (nonatomic) NSNumber * nibCornerRadius;

@property (nonatomic, copy) NSString *styleId;
@property (nonatomic, copy) NSString *styleClass;

+ (void)setGlobalStyler:(id<UIStyler>)styler;

@end

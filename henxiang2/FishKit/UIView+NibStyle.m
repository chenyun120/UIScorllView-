//
//  UIView+NibStyle.m
//  mplus
//
//  Created by QFish on 10/16/14.
//  Copyright (c) 2014 geek-zoo. All rights reserved.
//

#import "UIView+NibStyle.h"

static const void * kStyleClasskey;
static const void * kStyleClasseskey;
static const void * kStyleIdkey;

static id<UIStyler> globalStyler;

@implementation UIView (NibStyle)

@dynamic nibBackgroundColor;
@dynamic nibBorderColor, nibBorderWidth;
@dynamic nibCornerRadius;

@dynamic styleId, styleClass;

+ (void)setGlobalStyler:(id<UIStyler>)styler
{
    globalStyler = styler;
}

- (void)setNibBackgroundColor:(NSString *)nibBackgroundColor
{
//    self.backgroundColor = [UIColor colorWithHexString:nibBackgroundColor];
}

- (void)setNibBorderWidth:(NSNumber *)nibBorderWidth
{
    self.layer.borderWidth = nibBorderWidth.floatValue;
}

- (void)setNibBorderColor:(NSString *)nibBorderColor
{
//    self.layer.borderColor = [UIColor colorWithHexString:nibBorderColor].CGColor;
}

- (void)setNibCornerRadius:(NSNumber *)nibCornerRadius
{
    self.layer.cornerRadius = nibCornerRadius.floatValue;
}

#pragma mark -

- (NSString *)styleClass
{
	return nil;
//    return objc_getAssociatedObject(self, kStyleClasskey);
}

- (NSString *)styleId
{
	return nil;
//    NSString *id = objc_getAssociatedObject(self, kStyleIdkey);
//    return id;
}

- (void)setStyleClass:(NSString *)aClass
{
    // make sure we have a string - needed to filter bad input from IB
    aClass = [aClass description];
    
    // trim leading and trailing whitespace
    aClass = [aClass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
//    objc_setAssociatedObject(self, kStyleClasskey, aClass, OBJC_ASSOCIATION_COPY_NONATOMIC);
	
    //Precalculate classes array for performance gain
    NSArray *classes = [aClass componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    classes = [classes sortedArrayUsingComparator:^NSComparisonResult(NSString *class1, NSString *class2) {
        return [class1 compare:class2];
    }];
//    objc_setAssociatedObject(self, kStyleClasseskey, classes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setStyleId:(NSString *)anId
{
    // make sure we have a string - needed to filter bad input from IB
    anId = [anId description];
    
    // trim leading and trailing whitespace
    anId = [anId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
//    objc_setAssociatedObject(self, kStyleIdkey, anId, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

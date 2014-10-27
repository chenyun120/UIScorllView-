//
//  UIView+Nib.m
//  Foomoo
//
//  Created by QFish on 5/4/14.
//  Copyright (c) 2014 QFish.inc. All rights reserved.
//

#import "UIView+Nib.h"
#import "UIColor+PXColors.h"

@implementation UIView (Nib)

+ (instancetype)loadFromNib
{
    NSArray *nibs =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil];
    return [nibs firstObject];
}

+ (instancetype)loadFromNibWithFrame:(CGRect)frame
{
    UIView * nibView = [self loadFromNib];
    nibView.frame = frame;
    return nibView;
}

- (void)customize
{
    
}

@end

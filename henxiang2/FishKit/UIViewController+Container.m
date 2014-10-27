//
//  UIViewController+Container.m
//  Common
//
//  Created by QFish on 8/7/14.
//  Copyright (c) 2014 iNoknok. All rights reserved.
//

#import "UIViewController+Container.h"

@implementation UIViewController (Container)

- (void)displayChildViewController:(UIViewController*)childViewController
{
    [self addChildViewController:childViewController];                 // 1
//    childViewController.view.frame = self.view.bounds; // 2
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];          // 3
}

- (void)hideChildViewController:(UIViewController*)childViewController
{
    [childViewController willMoveToParentViewController:nil];  // 1
    [childViewController.view removeFromSuperview];            // 2
    [childViewController removeFromParentViewController];      // 3
}

@end

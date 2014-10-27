//
//  ViewController.m
//  henxiang2
//
//  Created by Chenyun on 14-9-23.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "ViewController.h"
#import "InfiniteScrollPicker.h"
#import "testScrollView.h"
#import "FishKit.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet InfiniteScrollPicker *sp;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	[self.view addSubview:[testScrollView loadFromNib]];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end

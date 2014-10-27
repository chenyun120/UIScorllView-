//
//  testScrollView.m
//  henxiang2
//
//  Created by Chenyun on 14-10-20.
//  Copyright (c) 2014年 geek-zoo. All rights reserved.
//

#import "testScrollView.h"

@implementation testScrollView

- (void)awakeFromNib
{
	NSMutableArray *set2 = [[NSMutableArray alloc] init];
	for (int i = 80; i <= 100; i++)
	{
		NSString * str = [NSString stringWithFormat:@"%d",i];
		[set2 addObject:str];
	}

	self.sp.labelAry = set2;

}

- (void)infiniteScrollPicker:(InfiniteScrollPicker *)infiniteScrollPicker didSelectAtImage:(NSString *)text
{
	NSLog(@"selected%@",text);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  InfiniteScrollPicker.m
//  InfiniteScrollPickerExample
//
//  Created by Philip Yu on 6/6/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import "InfiniteScrollPicker.h"
#import "UIView+viewController.h"

@implementation InfiniteScrollPicker

@synthesize labelAry = _labelAry;
@synthesize itemSize = _itemSize;
@synthesize alphaOfobjs;
@synthesize heightOffset;
@synthesize positionRatio;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		[self setArray];
    }

    return self;
}

- (void)awakeFromNib
{
	alphaOfobjs = 1.0;
	heightOffset = 0.0;
	positionRatio = 1.0;
	
	[self setArray];
}

- (void)initInfiniteScrollView
{
	[self setArray];
	
    if (_itemSize.width == 0 && _itemSize.height == 0)
	{
		if (_labelAry.count > 0)
		{
			_itemSize = CGSizeMake(50+35, 60);
		}
		else
		{
			_itemSize = CGSizeMake(self.frame.size.height/2, self.frame.size.height/2);
		}
    }

    self.pagingEnabled = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
	
    if (_labelAry.count > 0)
    {
        for (int i = 0; i < _labelAry.count; i++)
        {
            // Place images into the bottom of view
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake( 118 + i * _itemSize.width, 0, _itemSize.width, _itemSize.height)];
			label.text = [_labelAry objectAtIndex:i%_labelAry.count];
			label.textAlignment = NSTextAlignmentCenter;
			label.textColor = [UIColor blackColor];
			label.alpha = alphaOfobjs;
			label.font = [UIFont systemFontOfSize:50];
            [labelStore addObject:label];
            [self addSubview:label];
        }

        self.contentSize = CGSizeMake((_labelAry.count * _itemSize.width) + 270, 0);

        self.delegate = self;

        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^ {
            [self reloadViewWithOffset:0];
            dispatch_async(dispatch_get_main_queue(), ^ {
//                [self snapToAnEmotion];
            });
        });
    }
}

- (void)setLabelAry:(NSArray *)labelAry
{
	_labelAry = labelAry;
	[self initInfiniteScrollView];
}

- (void)setItemSize:(CGSize)itemSize
{
    itemSize = itemSize;
    [self initInfiniteScrollView];
}

// 0 - 160 - 320
// 0.5 - 1 - 0.5
// 10 - 50 - 10
// 0.5 - 1 - 0.5
- (void)animateWithLabel:(UILabel *)label time:(NSUInteger)time
{
	time = time % 321;

    CGFloat fontSize = 0;
    CGFloat alpha    = 0; 
    CGFloat scale    = 0;

	if ( time >= 160 && time <= 320 )
	{
		// 字体开始缩小 50~10

        fontSize = (28 + 22) - (18 + 22) *  (time - 160) / 160.f;
        alpha    = 1 - 0.5 * (time - 160) / 160.f;
        scale    = 1 - 0.5 * (time - 160) / 160.f;
	}
	else
	{
		// 字体开始放大 10~50

        fontSize = (10 + 18 + 22) *  time / 160.f;
        alpha    = 0.5 + 0.5 * time / 160.f;
        scale    = 1 - 0.5 * (160 - time) / 160.f;
	}

	label.layer.transform = CATransform3DMakeScale(scale, scale, 1);
    label.alpha = alpha;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	if (self.contentOffset.x > 0)
	{
		[self reloadViewWithOffset:self.contentOffset.x];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == 0 && !snapping) [self snapToAnEmotion];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (!snapping) [self snapToAnEmotion];
}

- (void)reloadViewWithOffset:(float)offset
{
//	NSLog( @"%f", offset );

    for (int i = 0; i < labelStore.count; i++)
	{
        UILabel *view = [labelStore objectAtIndex:i];

        if (view.center.x > offset && view.center.x < (offset + self.frame.size.width))
        {
			[self animateWithLabel:view time:((i * (50 + 35)) + 160 - offset)];
		}
		else
		{
			view.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1);
			view.alpha = alphaOfobjs;
		}
	}
}

- (void)snapToAnEmotion
{
    UILabel *biggestView;

    snapping = YES;

	int index = (self.contentOffset.x + 160 - 118) / (50 + 35);

	if (!labelStore.count)
		return;
	
	biggestView = [labelStore objectAtIndex:index];

	float newX = biggestView.center.x - biggestView.frame.size.width/2;

    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^ {

		[self setScrollEnabled:NO];

		[self setContentOffset:CGPointMake(newX - 118, 0) animated:YES];

        dispatch_async(dispatch_get_main_queue(), ^ {

            SEL selector = @selector(infiniteScrollPicker:didSelectAtImage:);

            if ([[self firstAvailableUIViewController] respondsToSelector:selector])
            {
                [[self firstAvailableUIViewController] performSelector:selector withObject:self withObject:biggestView.text];
                #pragma clang diagnostic pop
            }
            
            [self setScrollEnabled:YES];
            snapping = 0;
        });
    });
}

- (void)setArray
{
	if ( _labelAry == nil )
	{
		_labelAry = [[NSMutableArray alloc] init];
	}
	
	if ( labelStore == nil )
	{
		labelStore = [[NSMutableArray alloc] init];
	}
}

@end

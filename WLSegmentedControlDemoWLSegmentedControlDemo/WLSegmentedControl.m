//
//  ZZSegmentedControl.m
//  ZZVirtualFit
//
//  Created by Veilly on 15/5/29.
//  Copyright (c) 2015年 cn.veilly. All rights reserved.
//

#import "WLSegmentedControl.h"

#define spacing 10
#define lineHeigh 3

@implementation WLSegmentedControl
{
    UIView *bottomLine;
    UIButton *currentbtn;
}
- (id)initWithItems:(NSArray *)items andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.contentSize = items.count<=4? self.frame.size:CGSizeMake(self.frame.size.width/4*items.count, self.frame.size.height);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        CGFloat width = (frame.size.width-items.count-1)/items.count;
        for (id title in items)
        {
            if ([title isKindOfClass:[NSString class]])
            {
                NSInteger index  = [items indexOfObject:title];
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [btn setFrame:CGRectMake(index*(width+index), 0, width, frame.size.height-lineHeigh)];
                [btn setTag:index];
                [btn setTitle:title forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor colorWithRed:0.16 green:0.76 blue:0.6 alpha:1] forState:UIControlStateDisabled];
                [btn setTitleColor:[UIColor colorWithRed:0.61 green:0.61 blue:0.65 alpha:1] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnTapped:) forControlEvents:UIControlEventTouchUpInside];
                btn.titleLabel.font =[UIFont systemFontOfSize:(frame.size.height-lineHeigh)/2];
                [self addSubview:btn];
                
                UIView *sepLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame), 3, 1.0, CGRectGetHeight(frame)-6)];
                sepLine.backgroundColor = [UIColor colorWithRed:0.61 green:0.61 blue:0.65 alpha:1];
                if (index !=items.count-1) {
                    [self addSubview:sepLine];
                }
                
                if (index == 0)
                {
                    [self btnTapped:btn];
                }
            }
        }
        bottomLine = [[UIView alloc] initWithFrame:CGRectMake(spacing, frame.size.height-lineHeigh, width-spacing*2, lineHeigh)];
        [bottomLine setBackgroundColor:[UIColor colorWithRed:0.16 green:0.76 blue:0.6 alpha:1]];
        [self addSubview:bottomLine];
    }
    return self;
}


- (void)btnTapped:(UIButton *)sender
{
    [currentbtn setEnabled:YES];
    [sender setEnabled:NO];
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^
    {
        currentbtn.titleLabel.font = [UIFont systemFontOfSize:(self.frame.size.height-lineHeigh)/2];
       [bottomLine setCenter:CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame)+lineHeigh/2)];
        sender.titleLabel.font = [UIFont systemFontOfSize:(self.frame.size.height-lineHeigh)/2+4];
    }completion:^(BOOL finished) {
        if (_itemSelectedAtIndex) {
            self.itemSelectedAtIndex(sender.tag);
        }
        currentbtn = sender;
    }];
}


#pragma mark - setter
- (void)setButtonLineColor:(UIColor *)buttonLineColor
{
    _bottonLineColor=buttonLineColor;
    [bottomLine setBackgroundColor:buttonLineColor];
}

- (void)setItemNormalColor:(UIColor *)itemNormalColor
{
    _itemNormalColor=itemNormalColor;
    for (id item in self.subviews)
    {
        if ([item isKindOfClass:[UIButton class]])
        {
            [item setTitleColor:itemNormalColor forState:UIControlStateNormal];
        }
    }
}

- (void)setItemHeightColor:(UIColor *)itemHeightColor
{
    _itemHeightColor=itemHeightColor;
    for (id item in self.subviews)
    {
        if ([item isKindOfClass:[UIButton class]])
        {
            [item setTitleColor:itemHeightColor forState:UIControlStateDisabled];
        }
    }
}

- (void)setSeparatorLineColor:(UIColor *)separatorLineColor
{
    _separatorLineColor=separatorLineColor;
    for (id item in self.subviews)
    {
        if ([item isKindOfClass:[UIView class]])
        {
            [item setBackgroundColor:separatorLineColor];
        }
    }
}
- (void)setHiddenSeparatorLine:(BOOL)hiddenSeparatorLine
{
    _hiddenSeparatorLine=hiddenSeparatorLine;
    for (id item in self.subviews)
    {
        if ([item isKindOfClass:[UIView class]] && CGRectGetWidth(((UIView *)item).frame)==1.0)
        {
            [item setHidden:hiddenSeparatorLine];
        }
    }
}

- (void)setHiddenBottonLine:(BOOL)hiddenBottonLine
{
    _hiddenBottonLine = hiddenBottonLine;
    bottomLine.hidden = hiddenBottonLine;
    for (id item in self.subviews)
    {
        if ([item isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)item;
            [item setFrame:CGRectMake(btn.frame.origin.x, 0, btn.frame.size.width, hiddenBottonLine?self.frame.size.height:self.frame.size.height-lineHeigh)];
        }
    }
}

- (NSInteger)selectedItmeIndex
{
    return currentbtn.tag;
}
@end

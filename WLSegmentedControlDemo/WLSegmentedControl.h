//
//  ZZSegmentedControl.h
//  ZZVirtualFit
//
//  Created by Veilly on 15/5/29.
//  Copyright (c) 2015年 cn.veilly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLSegmentedControl : UIScrollView

- (id)initWithItems:(NSArray *)items andFrame:(CGRect)frame;

@property (nonatomic,strong) UIColor *buttomLineColor;
@property (nonatomic,strong) UIColor *itemNormalColor;
@property (nonatomic,strong) UIColor *itemHeightColor;
@property (nonatomic,strong) UIColor *separatorLineColor;
@property (nonatomic,assign) BOOL hiddenSeparatorLine;
@property (nonatomic,assign) BOOL hiddenButtomLine;
@property (nonatomic,readonly) NSInteger selectedItmeIndex;

@property (nonatomic,copy) void (^itemSelectedAtIndex)(NSInteger index);

@end

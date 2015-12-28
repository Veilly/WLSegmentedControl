# WLSegmentedControl

### A simple customer SegmentedControl

*	alloc and inition
	
		- (WLSegmentedControl *)segmentedControl
		{
		    if (_segmentedControl) {
		        return _segmentedControl;
		    }
		    _segmentedControl = [[WLSegmentedControl alloc] initWithItems:@[@"上衣",@"外套",@"连衣裙",@"裤子",@"鞋子"] andFrame:CGRectMake(0,SCREENHEIGHT/2,SCREENWIDTH,30)];
		    _segmentedControl.backgroundColor = [UIColor clearColor];
		    __weak typeof(self) vc= self;
		    _segmentedControl.itemSelectedAtIndex = ^(NSInteger index)
		    {
		        vc.selectedIndexLabel.text = [NSString stringWithFormat:@"当前选中的是：%ld",(long)index];
		    };
		    return _segmentedControl;
		}


*	if you want hidden the separatorLine
	
		self.segmentedControl.hiddenSeparatorLine= YES;

*	if you want hidden the buttomLine
	
		self.segmentedControl.hiddenButtomLine= YES;
*	you can change those color
*	
		self.segmentedControl.buttomLineColor= [UIColor redColor];
		self.segmentedControl.itemNormalColor= [UIColor blackColor];
		self.segmentedControl.itemHeightColor= [UIColor orangeColor];
		self.segmentedControl.separatorLineColor= [UIColor greenColor];